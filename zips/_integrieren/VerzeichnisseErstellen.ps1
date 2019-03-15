$outpath="C:\Users\user\Documents\GitHub\hermito-repo\zips\_integrieren"

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

$zips=gci $outpath -filter *.zip |Sort-Object name -Descending
foreach ($zipfile in $zips)
{
    $Zipdatei=$zipfile.fullname
    Unzip $Zipdatei $outpath
}

$ordnerliste=gci $outpath -Directory
foreach ($ordner in $ordnerliste)
{
    $Ordnerpfad = $ordner.fullname
    $Ordnername = $ordner.name
    write-host $Ordnerpfad
    Remove-Item $Ordnerpfad\* -recurse -exclude addon.xml
    $Kopierquelle=gci $outpath -Filter $Ordnername*.zip
    $Kopierquelle=$Kopierquelle.fullname
    Copy-Item $Kopierquelle $Ordnerpfad
}