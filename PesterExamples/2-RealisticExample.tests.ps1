. './2-RealisticExample.ps1'

Describe 'Remove-TempFile tests' {
    $TestFile = New-Item /tmp/test.tmp
    
    It 'Should return nothing' {
        Remove-TempFile -Path /tmp | Should -Be $null
    }
    It 'Should remove the test file' {
        $TestFile | Should -Not -Exist
    }
    It 'Should not return an error' {
        { Remove-TempFile -Path /tmp } | Should -Not -Throw
    }
}