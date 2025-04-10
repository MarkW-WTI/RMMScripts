# Set variables
$zipUrl = "https://github.com/MarkW-WTI/RMMScripts/raw/refs/heads/main/O365%20-%20x64%20en-US.zip"
$tempPath = "C:\temp"
$zipFile = "$tempPath\O365.zip"
$scriptFolder = "$tempPath\O365 - x64 en-US"
$scriptToRun = "$scriptFolder\installO365x64EN.ps1"

# Create temp directory if it doesn't exist
if (-not (Test-Path $tempPath)) {
    New-Item -Path $tempPath -ItemType Directory | Out-Null
}

# Download the ZIP file
Invoke-WebRequest -Uri $zipUrl -OutFile $zipFile

# Extract ZIP contents
Expand-Archive -Path $zipFile -DestinationPath $tempPath -Force

# Run the install script silently with working directory set
if (Test-Path $scriptToRun) {
    Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -NoProfile -WindowStyle Hidden -File `"$scriptToRun`"" `
        -WorkingDirectory "$scriptFolder" -WindowStyle Hidden
} else {
    Write-Error "$scriptToRun not found."
}
