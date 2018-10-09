function Get-TempFile ($Path) {
    Get-ChildItem "$Path/*tmp*"
}

function Remove-TempFile ($Path) {
    $TempFiles = Get-TempFile -Path $Path
    $TempFiles | Remove-Item
}