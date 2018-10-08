. './5-MockingMissingFunctions.ps1'

Describe 'Remove-ADDisabledUser tests' {
    Function Get-ADUser { }
    Function Remove-ADUser { }

    Mock Get-ADUser {
        [PSCustomObject]@{
            SamAccountName = 'Tony Stark'
            LastLogonDate = (Get-Date).AddDays(-35)
            Enabled = $False
        }
        [PSCustomObject]@{
            SamAccountName = 'Pepper Pots'
            LastLogonDate = (Get-Date).AddDays(-15)
            Enabled  = $False
        }
    }
    Mock Remove-ADUser { }

    It 'Should return one user' {
        @((Remove-ADDisabledUser -OutputUsers)).count | Should -Be 1
    }
}