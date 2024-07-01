Configuration Application
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

    
        AADApplication "AADApplication-DSCMH"
        {
            AppId                   = "3cae8529-68e6-4e08-b867-3fcf493c55b5";
            ApplicationId           = $ApplicationId;
            AvailableToOtherTenants = $False;
            CertificateThumbprint   = $CertificateThumbprint;
            DisplayName             = "DSCMH";
            Ensure                  = "Present";
            IdentifierUris          = @();
            IsFallbackPublicClient  = $False;
            KnownClientApplications = @();
            ObjectId                = "2b4386ea-3808-4361-a680-38d4f14a913a";
            Owners                  = @();
            Permissions             = @(MSFT_AADApplicationPermission {
                Name                = 'Organization.Read.All'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'Agreement.Read.All'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'Application.Read.All'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'Group.Read.All'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'Policy.Read.All'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'Policy.ReadWrite.ConditionalAccess'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'RoleManagement.Read.Directory'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'User.Read.All'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'Group.ReadWrite.All'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'RoleManagement.ReadWrite.Directory'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'ReportSettings.ReadWrite.All'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'User.ReadWrite.All'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'Policy.ReadWrite.AuthenticationMethod'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'Application.ReadWrite.All'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'DelegatedPermissionGrant.ReadWrite.All'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'AppRoleAssignment.ReadWrite.All'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'EventListener.ReadWrite.All'
                Type                = 'AppOnly'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
            );
            PublicClient            = $False;
            ReplyURLs               = @();
            TenantId                = $OrganizationName;
        }

        AADApplication "AADApplication-b2c-extensions-app. Do not modify. Used by AADB2C for storing user data."
        {
            AppId                   = "cc189439-db5d-4613-816b-ce0ebc585f4c";
            ApplicationId           = $ApplicationId;
            AvailableToOtherTenants = $False;
            CertificateThumbprint   = $CertificateThumbprint;
            DisplayName             = "b2c-extensions-app. Do not modify. Used by AADB2C for storing user data.";
            Ensure                  = "Present";
            Homepage                = "https://ASwisssbankEXT.onmicrosoft.com/cpimextensions";
            IdentifierUris          = @("https://ASwisssbankEXT.onmicrosoft.com/cpimextensions");
            IsFallbackPublicClient  = $False;
            KnownClientApplications = @();
            ObjectId                = "3218dc79-280c-402b-bc0f-f4ec1ca4aaa0";
            Owners                  = @();
            Permissions             = @(MSFT_AADApplicationPermission {
                Name                = 'Directory.ReadWrite.All'
                Type                = 'AppOnly'
                SourceAPI           = 'Windows Azure Active Directory'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'Directory.Read.All'
                Type                = 'AppOnly'
                SourceAPI           = 'Windows Azure Active Directory'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'User.Read'
                Type                = 'Delegated'
                SourceAPI           = 'Windows Azure Active Directory'
                AdminConsentGranted = $False
            }
            );
            PublicClient            = $False;
            ReplyURLs               = @("https://ASwisssbankEXT.onmicrosoft.com/cpimextensions");
            TenantId                = $OrganizationName;
        }

        AADApplication "AADApplication-ciam-msal-react-spa"
        {
            AppId                   = "2df0511d-1921-4538-9ad1-a167e30677a1";
            ApplicationId           = $ApplicationId;
            AvailableToOtherTenants = $False;
            CertificateThumbprint   = $CertificateThumbprint;
            DisplayName             = "ciam-msal-react-spa";
            Ensure                  = "Present";
            IdentifierUris          = @();
            IsFallbackPublicClient  = $False;
            KnownClientApplications = @();
            ObjectId                = "410c1dc8-4c8e-4ffa-9fc8-81b9ae454dd3";
            Owners                  = @();
            Permissions             = @(MSFT_AADApplicationPermission {
                Name                = 'c5904951-3972-4040-8240-0a27306e29fd'
                Type                = 'Delegated'
                SourceAPI           = ''
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = '3fbffc85-572e-4bfa-9ded-a235ced26eed'
                Type                = 'Delegated'
                SourceAPI           = ''
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'openid'
                Type                = 'Delegated'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
MSFT_AADApplicationPermission {
                Name                = 'offline_access'
                Type                = 'Delegated'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
            );
            PublicClient            = $False;
            ReplyURLs               = @();
            TenantId                = $OrganizationName;
        }

        AADApplication "AADApplication-Test App 2"
        {
            AppId                   = "b3ab7a5e-41cd-482f-89ae-ee317fa58ae1";
            ApplicationId           = $ApplicationId;
            AvailableToOtherTenants = $False;
            CertificateThumbprint   = $CertificateThumbprint;
            DisplayName             = "Test App 2";
            Ensure                  = "Present";
            IdentifierUris          = @();
            IsFallbackPublicClient  = $False;
            KnownClientApplications = @();
            ObjectId                = "6eaf154f-4b58-439c-9e06-216803a18d8d";
            Owners                  = @();
            Permissions             = @(MSFT_AADApplicationPermission {
                Name                = 'User.Read'
                Type                = 'Delegated'
                SourceAPI           = 'Microsoft Graph'
                AdminConsentGranted = $False
            }
            );
            PublicClient            = $False;
            ReplyURLs               = @("https://jwt.ms");
            TenantId                = $OrganizationName;
        }

        AADApplication "AADApplication-ciam-msal-dotnet-api"
        {
            AppId                   = "a6e46157-49b1-4341-a074-cb29f16f35e4";
            ApplicationId           = $ApplicationId;
            AvailableToOtherTenants = $False;
            CertificateThumbprint   = $CertificateThumbprint;
            DisplayName             = "ciam-msal-dotnet-api";
            Ensure                  = "Present";
            IdentifierUris          = @("api://a6e46157-49b1-4341-a074-cb29f16f35e4");
            IsFallbackPublicClient  = $False;
            KnownClientApplications = @();
            ObjectId                = "dbe07516-80f2-4c62-bc35-ff1728596823";
            Owners                  = @();
            PublicClient            = $False;
            ReplyURLs               = @();
            TenantId                = $OrganizationName;
        }
    }
