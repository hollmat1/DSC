Configuration AADConfiguration
{
    param
    (       
    )

    Import-DscResource -ModuleName AADConfig

    node localhost
    {
        SecurityDefaults 'SecurityDefaults_Configuration'
        {
            ApplicationId = $ConfigurationData.NonNodeData.Environment.ApplicationId
            TenantId      = $ConfigurationData.NonNodeData.Environment.TenantId
            Thumbprint    = $ConfigurationData.NonNodeData.Environment.CertificateThumbprint
            OrganizationName = $ConfigurationData.NonNodeData.Environment.OrganizationName
        }

        AuthenticationMethodPolicy 'AuthenticationMethodPolicy_Configuration'
        {
            ApplicationId = $ConfigurationData.NonNodeData.Environment.ApplicationId
            TenantId      = $ConfigurationData.NonNodeData.Environment.TenantId
            Thumbprint    = $ConfigurationData.NonNodeData.Environment.CertificateThumbprint
            OrganizationName = $ConfigurationData.NonNodeData.Environment.OrganizationName
        }

        Application 'Application_Configuration'
        {
            ApplicationId = $ConfigurationData.NonNodeData.Environment.ApplicationId
            TenantId      = $ConfigurationData.NonNodeData.Environment.TenantId
            Thumbprint    = $ConfigurationData.NonNodeData.Environment.CertificateThumbprint
            OrganizationName = $ConfigurationData.NonNodeData.Environment.OrganizationName
        }
    }
}
