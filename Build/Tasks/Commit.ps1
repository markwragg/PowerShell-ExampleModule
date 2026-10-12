Task 'Commit' -Depends 'Init' {
    $lines

    Set-Location $ProjectRoot
    $Module = $env:BHProjectName

    git --version
    git config --global user.email "build@azuredevops.com"
    git config --global user.name "AzureDevOps"
    git checkout $env:BUILD_SOURCEBRANCHNAME

    git add Documentation/*.md
    git add README.md
    git add CHANGELOG.md
    git commit -m "[skip ci] AzureDevOps Build $($env:BUILD_BUILDID)"
    git push
}
