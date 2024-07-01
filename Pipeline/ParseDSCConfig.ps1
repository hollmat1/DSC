
param(
    #[parameter(Mandatory)]
    [ValidateSet("Eng","Dev","PreProd","Prod")]
    $TenantStage = "Eng"
)

function Write-DscCompositeResource {

    param(
        $resourceName,
        $ExportFilePath
    )

    $tempate = @"
Configuration <ResourceName>
{
    param
    (
        [Parameter()]
        [System.String]
        `$ApplicationId,

        [Parameter()]
        [System.String]
        `$TenantId,

        [Parameter()]
        [System.String]
        `$Thumbprint,

        [Parameter()]
        [System.String]
        `$OrganizationName
    )

    Import-DscResource -ModuleName Microsoft365DSC

    `$paramCount = ($PSBoundParameters.GetEnumerator() | Where-Object -FilterScript { `$_.Key -in 'ApplicationId', 'TenantId', 'Thumbprint' }).Count
    if ($paramCount -gt 0 -and $paramCount -lt 3) {
        throw 'Please specify ApplicationId, TenantId and Thumbprint'
    }

    <Resources>

}
"@

    $fileContent = Get-Content $ExportFilePath -Raw

    $resources = ConvertTo-DSCObject -Content $fileContent -IncludeComments:$false

    $filteredResources = $resources  | ? { $_.ResourceName  -eq $resourceName }

    $ExportFilePath = $tempate -replace "<ResourceName>", $resourceName
    $ExportFilePath -replace "<Resources>", (ConvertFrom-DSCObject $filteredResources)

}

$basedir = Split-Path -parent $MyInvocation.MyCommand.Path
$baseconfigdir = Split-Path -parent $basedir

$config = Get-Content $baseconfigdir\Config\GlobalConfig-$TenantStage.json -Raw | ConvertFrom-Json

if($null -eq $config) {
    Write-Error "Config was not loaded.  Expected $baseconfigdir\Config\GlobalConfig-$TenantStage.json"
    exit 999
}

$appid = $config.appid
$certthumb = $config.certthumb
$exttenant = $config.exttenant


$config.DSCResourcesExport | % {

    $result = Write-DscCompositeResource -resourceName $_ -ExportFilePath C:\Users\matty\Data\Source\B2C\Automation\DSC\M365Config.ps1

    $result >C:\temp\$($_).ps1
}
#Compare-M365DSCConfigurations -Source C:\Users\matty\Data\Source\B2C\Automation\DSC\M365Config.ps1 -Destination C:\Users\matty\Data\Source\B2C\Automation\DSC\M365Config.ps1 
