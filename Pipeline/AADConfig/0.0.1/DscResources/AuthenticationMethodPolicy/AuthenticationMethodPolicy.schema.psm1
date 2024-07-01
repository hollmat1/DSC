Configuration AuthenticationMethodPolicy
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


    AADAuthenticationMethodPolicy "AADAuthenticationMethodPolicy-Authentication Methods Policy" {
            ApplicationId               = $ApplicationId;
            CertificateThumbprint       = $Thumbprint;
            Description                 = "The tenant-wide policy that controls which authentication methods are allowed in the tenant, authentication method registration requirements, and self-service password reset settings";
            DisplayName                 = "Authentication Methods Policy";
            Ensure                      = "Present";
            Id                          = "authenticationMethodsPolicy";
            PolicyVersion               = "1.5";
            RegistrationEnforcement     = MSFT_MicrosoftGraphregistrationEnforcement{

                AuthenticationMethodsRegistrationCampaign = MSFT_MicrosoftGraphAuthenticationMethodsRegistrationCampaign{
                    SnoozeDurationInDays = 1


                    IncludeTargets = @(
                        MSFT_MicrosoftGraphAuthenticationMethodsRegistrationCampaignIncludeTarget{
                            TargetedAuthenticationMethod = 'microsoftAuthenticator'
                            TargetType = 'group'
                            Id = 'all_users'
                        }
                    )
                    State = 'default'
                }
            
            };
            SystemCredentialPreferences = MSFT_MicrosoftGraphsystemCredentialPreferences{


                IncludeTargets = @(
                    MSFT_AADAuthenticationMethodPolicyIncludeTarget{
                        Id = 'all_users'
                        TargetType = 'group'
                    }
                )
                State = 'default'
            };
            TenantId                    = $OrganizationName;
        }
}
