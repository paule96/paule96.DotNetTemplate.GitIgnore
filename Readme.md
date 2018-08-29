# Welcome to dotnet new GitIgnoreTemplates

With this dotnet new Template you can add .gitignore to your project. the .gitignore files come from [gitignore](https://github.com/github/gitignore).

| Build of Template | Update Template | Nuget.org Release
|:-----------------:|:---------------:|:----------------:|
|[![Build status](https://paule96.visualstudio.com/paule96.DotNetTemplate.GitIgnore/_apis/build/status/paule96.DotNetTemplate.GitIgnore-CI)](https://paule96.visualstudio.com/paule96.DotNetTemplate.GitIgnore/_build/latest?definitionId=1) | [![Build status](https://paule96.visualstudio.com/paule96.DotNetTemplate.GitIgnore/_apis/build/status/Update%20gitignores%20in%20paule96.DotNetTemplate.GitIgnore)](https://paule96.visualstudio.com/paule96.DotNetTemplate.GitIgnore/_build/latest?definitionId=2) | ![Release Status to nuget.org](https://paule96.vsrm.visualstudio.com/_apis/public/Release/badge/26b61fe6-be56-4f0b-94c3-2c001318f7a5/1/2)

[![NuGet downloads](https://img.shields.io/nuget/dt/paule96.DotNetTemplate.GitIgnore.svg)](https://www.nuget.org/packages/paule96.DotNetTemplate.GitIgnore/)
[![NuGet version](https://img.shields.io/nuget/vpre/paule96.DotNetTemplate.GitIgnore.svg)](https://www.nuget.org/packages/paule96.DotNetTemplate.GitIgnore/)

## Install and Run the Template

1. install the template on your system
```bash
dotnet new -i paule96.DotNetTemplate.GitIgnore
```
2. run the help to see what gitignore files you can create
```bash
dotnet new ignore --help
```
3. create your gitignore file
```bash
dotnet new ignore -ig VisualStudio
```

## Build the template

1. Open this project in [VSCode](https://code.visualstudio.com/) and run the "Build Template" command from the launch.json.

2. Add the build result as template to your dotnet cli:

```powershell
dotnet new -i .\src\paule96.DotNetTemplate.GitIgnore.Build\bin\paule96.DotNetTemplate.GitIgnore\
```