##########################################
##     Download Office 365 to folder    ##
##  After download, install Office 365  ##
##########################################
## Current script path
$path = $pwd.path

## Download Office 365
Write-Host "Bezig met downloaden van Office 365 64bit Nederlands..."
.\setup.exe /download .\configuration-USB.xml | Wait-Process

## Install Office 365
Write-Host "Bezig met het installeren van Office 365... Administratie rechten kunnen worden gevraagd..."
.\setup.exe /configure .\configuration-USB.xml | Wait-Process
Write-Host "Installatie van Office 365 voltooid..."

## Remove Office 365 installation files.
Write-Host "Office 365 installatie bestanden verwijderen..."
Remove-Item $path\Office -Force -Recurse
Write-Host "Installatie bestanden verwijderd..."

## Exit on key...
Write-Host -NoNewLine 'Druk op een toets om af te sluiten....';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
exit