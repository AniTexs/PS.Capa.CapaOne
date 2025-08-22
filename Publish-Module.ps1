$ModulePath = Join-Path ([String]::IsNullOrEmpty($PSScriptRoot) ? (Get-Location).Path : $PSScriptRoot) "PS.Capa.Capaone"
$Module = Get-Module -Name $ModulePath -ErrorAction Stop -ListAvailable
Write-Host "Publishing module $($Module.Name)"
$PsdPath = Join-Path $ModulePath "$($Module.Name).psd1"
$Version = $Module.Version.ToString()

$Exist = Find-PSResource -Name $Module.Name -Type Module -Version $Version -Repository 'PSGallery' -Prerelease -ErrorAction SilentlyContinue
if ($Exist) {
    Write-Host "Module $($Module.Name) version $Version already published. Skipping" -ForegroundColor Green
    continue
}

try {
    Publish-PSResource -Path $ModulePath -ApiKey $env:APIKEY -SkipDependenciesCheck -SkipModuleManifestValidate -Repository 'PSGallery'
}
catch {
    Write-Host "Failed to publish module $($Module.Name)" -ForegroundColor Red
    Write-Host $_.Exception.Message
    Write-Host "Psd path: $PsdPath"

    Test-ModuleManifest -Path $PsdPath
    Write-Host $Error[0].Exception.Message
}


$Run = $true

while ($Run) {
    if (Find-Module -Name $Module.Name -RequiredVersion $Version -ErrorAction SilentlyContinue -AllowPrerelease) {
        $Run = $false
    }
    else {
        Start-Sleep -Seconds 1
    }
}