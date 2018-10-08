function Remove-TempFile ($Path) {
    $TempFiles = Get-ChildItem "$Path/*.tmp"
    $TempFiles | Remove-Item
}