# PowerShell-ExampleModule

This example repository contains a basic PowerShell module and Pester test structure, with build and deployment scripts for execution via Azure DevOps.

## Implementing Azure DevOps for a new module

1. Copy the azure-pipelines.yml and Build folder from this repo, into the repo you want to build.
2. Update azure-pipeline.yml to specify either Master or Main for the branch names, depending on which the repo uses.
3. Go to the GitHub repo for the module > Wiki > Create the first page.
4. Go to Azure DevOps, create a new pipeline > GitHub > point to the azure-pipelines.yml.
5. Create a CHANGELOG.md file in the root of the project repo.

You can now either execute the pipeline manually to test, or commit changes to the repo.

