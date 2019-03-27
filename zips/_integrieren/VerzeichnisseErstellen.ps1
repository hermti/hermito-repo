$outpath="C:\Users\user\Documents\GitHub\hermito-repo\zips\_integrieren"

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

$zips=gci $outpath -filter *.zip |Sort-Object name -Descending
$anzahl=$zips.count
$zaehler=1
write-host "Entpacken..." -ForegroundColor green
foreach ($zipfile in $zips)
{
    write-host "$zaehler / $anzahl" -ForegroundColor green
    $zaehler++
    $Zipdatei=$zipfile.fullname
    Unzip $Zipdatei $outpath
}

write-host "Bereinigen..." -ForegroundColor green
$ordnerliste=gci $outpath -Directory
$anzahl=$ordnerliste.count
$zaehler=1
foreach ($ordner in $ordnerliste)
{
    write-host "$zaehler / $anzahl" -ForegroundColor green
    $zaehler++
    $Ordnerpfad = $ordner.fullname
    $Ordnername = $ordner.name
    write-host $Ordnerpfad
    Remove-Item $Ordnerpfad\* -recurse -exclude addon.xml
    $Kopierquelle=gci $outpath -Filter $Ordnername*.zip
    $Kopierquelle=$Kopierquelle.fullname
    Copy-Item $Kopierquelle $Ordnerpfad
}