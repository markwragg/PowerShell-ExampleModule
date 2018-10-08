. './4-MockingExample.ps1'
Describe 'Remove-TempFile tests' {
    Mock Remove-Item { }

    New-Item TestDrive:/test.tmp
    New-Item TestDrive:/tmp.doc

    $TestResult = Remove-TempFile -Path TestDrive:\

    It 'Should return nothing' {
        $TestResult | Should -Be $null
    }
    It 'Should call Remove-Item' {
        Assert-MockCalled Remove-Item -Times 1 -Exactly
    }
}