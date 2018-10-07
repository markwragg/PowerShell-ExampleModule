. './1-SimpleExample.ps1'

Describe 'Add-One tests' {
    It 'Should add one to a number' {
        Add-One 1 | Should -Be 2
    }
    It 'Should add one to a negative number' {
        Add-One -1 | Should -Be 0
    }
}
