$ordner=gci "C:\Users\user\Documents\GitHub\hermito-repo\zips" -directory
foreach ($i in $ordner)
{
    $plugin=$i.name
    if ($plugin -like "plugin.*" -or $plugin -like "repository.*")
    {
        echo "<import version=`"0.0.0`" addon=`"$plugin`"/>"
    }
    
}