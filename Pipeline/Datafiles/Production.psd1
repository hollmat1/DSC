@{
    AllNodes    = @(
        @{
            NodeName                    = 'localhost'
            CertificateFile             = '.\DSCCertificate.cer'
            PsDscAllowPlainTextPassword = $true
            PsDscAllowDomainUser        = $true
        }
    )
    NonNodeData = @{
        Environment    = @{
            Name             = 'Production'
            ShortName        = 'PRD'

            # Tenant's default verified domain name
            OrganizationName = "ASwisssbankEXT.onmicrosoft.com"

            # Azure AD Application Id for Authentication
            ApplicationId = "3cae8529-68e6-4e08-b867-3fcf493c55b5"

            # The Id or Name of the tenant to authenticate against
            TenantId = "ASwisssbankEXT.onmicrosoft.com"

            # Thumbprint of the certificate to use for authentication
            CertificateThumbprint = "E09BDD35610EAAFACBBAA23B7B507775A0C527CC"        
        }
    }
}