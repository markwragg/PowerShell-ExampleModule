function Get-TempFile ($Path) {
    Get-ChildItem "$Path/*tmp*"
}

function Remove-TempFile ($Path) {
    $TempFiles = Get-TempFile -Path $Path
    $TempFiles | Remove-Item
}

Describe 'Get-TempFile tests' {
    New-Item TestDrive:/test.tmp
    New-Item TestDrive:/tmp.doc

    It 'Should return only .tmp files' {
        (Get-TempFile -Path TestDrive:/).Extension | Should -Be '.tmp'
    }
}