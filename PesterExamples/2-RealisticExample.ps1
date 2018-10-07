function Remove-TempFile ($Path) {
    $TempFiles = Get-ChildItem "$Path/*.tmp"
    $TempFiles | Remove-Item
}

Describe 'Remove-TempFile tests' {
    New-Item /tmp/test.tmp
    
    It 'Should return nothing' {
        Remove-TempFile -Path /tmp | Should -Be $null
    }
    It 'Should not return an error' {
        { Remove-TempFile -Path /tmp } | Should -Not -Throw
    }
}