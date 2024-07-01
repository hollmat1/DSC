@{
    RootModule           = 'Application.schema.psm1'

    ModuleVersion        = '0.0.1'

    GUID                 = 'db9a130e-162a-43d7-83e0-b5ebe845dc22'

    Author               = 'Matthew Holland'

    CompanyName          = 'UBS'

    Copyright            = 'Copyright to UBS. All rights reserved.'

    #RequiredModules      = @(
    #    @{ ModuleName = 'xPSDesiredStateConfiguration'; ModuleVersion = '8.4.0.0' }
    #)

    DscResourcesToExport = @('Application')
}