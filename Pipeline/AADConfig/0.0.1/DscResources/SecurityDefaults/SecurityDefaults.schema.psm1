Configuration SecurityDefaults
{
    param
    (
        [Parameter()]
        [System.String]
        $ApplicationId,

        [Parameter()]
        [System.String]
        $TenantId,

        [Parameter()]
        [System.String]
        $Thumbprint,

        [Parameter()]
        [System.String]
        $OrganizationName
    )

    Import-DscResource -ModuleName Microsoft365DSC

    $paramCount = ($PSBoundParameters.GetEnumerator() | Where-Object -FilterScript { $_.Key -in 'ApplicationId', 'TenantId', 'Thumbprint' }).Count
    if ($paramCount -gt 0 -and $paramCount -lt 3)
    {
        throw 'Please specify ApplicationId, TenantId and Thumbprint'
    }


    AADSecurityDefaults "AADSecurityDefaults" {
    
        ApplicationId         = $ApplicationId;
        CertificateThumbprint = $Thumbprint;
        Description           = "Security defaults is a set of basic identity security mechanisms recommended by Microsoft. When enabled, these recommendations will be automatically enforced in your organization. Administrators and users will be better protected from common identity related attacks.";
        DisplayName           = "Security Defaults";
        IsEnabled             = $False;
        IsSingleInstance      = "Yes";
        TenantId              = $OrganizationName;
    }
}
