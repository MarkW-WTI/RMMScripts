##########################################
##     Download Office 365 to folder    ##
##  After download, install Office 365  ##
##########################################
## Current script path
$path = $pwd.path

## Download Office 365
Write-Host "Downloading Office 365 64bit English..."
.\setup.exe /download .\configuration-USB.xml | Wait-Process

## Install Office 365
Write-Host "Installing Office 365..."
.\setup.exe /configure .\configuration-USB.xml | Wait-Process
Write-Host "Installing Office 365 completed..."

## Remove Office 365 installation files.
Write-Host "Removing Office 365 installation files... Administrator request may show up..."
Remove-Item $path\Office -Force -Recurse
Write-Host "Installation files removed..."

## Exit on key...
Write-Host -NoNewLine 'Press any key to continue...';
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');
exit