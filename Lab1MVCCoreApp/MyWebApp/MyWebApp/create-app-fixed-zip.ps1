Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$source = (Resolve-Path ".\publish").Path
$zip = Join-Path (Get-Location) "app-fixed.zip"

if (Test-Path $zip) {
    Remove-Item $zip
}

$archive = [System.IO.Compression.ZipFile]::Open(
    $zip,
    [System.IO.Compression.ZipArchiveMode]::Create
)

Get-ChildItem -LiteralPath $source -Recurse -File |
    ForEach-Object {
        $relative = $_.FullName.Substring($source.Length).
            TrimStart([char[]]@('\', '/'))

        $entry = $relative -replace '\\', '/'

        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
            $archive,
            $_.FullName,
            $entry,
            [System.IO.Compression.CompressionLevel]::Optimal
        ) | Out-Null
    }

$archive.Dispose()

Write-Host "Created app-fixed.zip successfully"
