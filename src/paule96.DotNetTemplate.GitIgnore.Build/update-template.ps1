[Net.ServicePointManager]::SecurityProtocol = 
[Net.SecurityProtocolType]::Tls12 -bor `
    [Net.SecurityProtocolType]::Tls11 -bor `
    [Net.SecurityProtocolType]::Tls -bor `
    [Net.SecurityProtocolType]::Ssl3

$commitUrl = "https://api.github.com/repos/github/gitignore/commits";

$response = Invoke-WebRequest -Uri $commitUrl -UseBasicParsing;

$filelistUri = (ConvertFrom-Json $response.Content)[0].commit.tree.url;


$response = Invoke-WebRequest -Uri $filelistUri -UseBasicParsing;

$filelist = ConvertFrom-Json $response.Content;


$baserawurl = "https://raw.githubusercontent.com/github/gitignore/master/"

$outputjson = Get-Content .\base.template.json |  ConvertFrom-Json 


$choices = New-Object System.Collections.ArrayList($null);
$sources = New-Object System.Collections.ArrayList($null);

## create all missing folders:
if((Test-Path -Path .\bin\paule96.DotNetTemplate.GitIgnore\.template.config) -ne $true){
    mkdir -Path .\bin\paule96.DotNetTemplate.GitIgnore\.template.config -Force;
}

$filelist.tree | Where-Object {
    $_.path.Contains(".gitignore");
} | ForEach-Object {
    $rawuri = $baserawurl + $_.path;
    $filename = $_.path;
    $outputfile = $PWD.Path + "\\bin\\paule96.DotNetTemplate.GitIgnore\\" + $_.path;
    Invoke-WebRequest -Uri $rawuri  -OutFile $outputfile;
    $parameterName = $_.path.Replace(".gitignore", "");
    $choices.Add(@{"choice" = "$parameterName"; "description" = ""}) > $null;
    $sources.Add(@{
            "source"    = "./";
            "target"    = "./";
            "include"   = @(
                "$filename"
            );
            "rename"    = @{
                "$filename" = ".gitignore"
            };
            "condition" = "(ignoreName) == $parameterName";
        }) > $null;
}

$outputjson.symbols.ignoreName.choices = $choices.ToArray();
$outputjson.sources = $sources.ToArray();

$outputjson | ConvertTo-Json -Depth 100 > .\bin\paule96.DotNetTemplate.GitIgnore\.template.config\template.json;

