#! /usr/bin/env pwsh
#Requires -Version 7.0
#Requires -PSEdition Core

# This script is for locally testing AOT compilation. It is not used in the build pipeline.

param (
    [string] $Configuration = "Release",
    [string] $RuntimeIdentifier
)

$publishProjectPaths = @(
    "src/ReproAspnetcore57756/ReproAspnetcore57756.csproj"
)

dotnet workload restore

foreach ($publishProjectPath in $publishProjectPaths) {
    Write-Host "Publishing $publishProjectPath for $RuntimeIdentifier"
    dotnet publish $publishProjectPaths -c Release -r $RuntimeIdentifier --self-contained

    if ($LASTEXITCODE -ne 0) {
        throw "dotnet pack failed with exit code $LASTEXITCODE"
    }
}