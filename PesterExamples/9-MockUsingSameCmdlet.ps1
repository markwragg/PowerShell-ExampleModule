
Describe 'Get-Date' {
    $GetDate = Get-Command Get-Date

    Mock Get-Date {
        & $GetDate '01-01-2018'
    }

    Get-Date | Should -Be '2018-01-01T00:00:00.0000000'
}