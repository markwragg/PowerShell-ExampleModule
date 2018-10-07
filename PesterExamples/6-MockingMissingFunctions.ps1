function Remove-ADDisabledUser {
    [cmdletbinding()]
    Param(
        [int]
        $Days = 30,

        [switch]
        $OutputUsers
    )

    $Users = Get-ADUser -Filter 'Enabled -eq $false' -Properties LastLogonDate
    $Users = $Users | Where-Object { $_.LastLogonDate -lt `
    (Get-Date).AddDays(-$Days) }

    if (-not $Users) {
        Write-Verbose "No disabled users found older than $Days days"
    }
    else {
        $Users | Remove-ADUser
        Write-Verbose "$(@($Users).count) users removed."
    }

    if ($OutputUsers) {
        $Users
    }
}

Describe 'Remove-ADDisabledUser tests' {
    
    Mock Get-ADUser {
        New-Object Microsoft.ActiveDirectory.Management.ADUser Identity -Property @{
            SamAccountName = 'Tony Stark'
            LastLogonDate = (Get-Date).AddDays(-35)
            Enabled = $False
        }
        New-Object Microsoft.ActiveDirectory.Management.ADUser Identity -Property @{
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