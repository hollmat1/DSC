@{
    ModuleVersion        = '0.0.1'

    GUID                 = '8c07a295-6a8d-465d-933d-9f598d77fdfb'

    Author               = 'Matt Holland'

    CompanyName          = 'UBS'

    RequiredModules      = @()

    DscResourcesToExport = @('*')

    Description          = 'DSC composite resource for configuring AAD'

    PrivateData          = @{

        PSData = @{

            Tags                       = @('DSC', 'Configuration', 'Composite', 'Resource', 'Microsoft365DSC')

            ExternalModuleDependencies = @('Microsoft365DSC')

        }
    }
}