$Root = Split-Path $PSScriptRoot -Parent

Import-Module "$Root/ExampleModule/"

Describe 'Get-Example' {

    InModuleScope 'ExampleModule' {

        It 'Should return "I am an example"' {
            Get-Example | Should -Be 'I am an example!'
        }
        
    }
}
