$Root = Split-Path $PSScriptRoot -Parent
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'

. "$Root/ExampleModule/Public/$sut"

Describe "Get-Example" {
    It "does something useful" {
        Get-Example | Should -Be 'I am an example!'
    }
}
