# Define the paths
$MWSupportPath = "C:\MWSupport"
$ToolsPath = "$MWSupportPath\tools"
$SpeedtestLogPath = "$MWSupportPath\speedtestlogs"

# Check if the folders exist, create them if not
if (-not (Test-Path $ToolsPath)) {
    New-Item -Path $ToolsPath -ItemType Directory
}

if (-not (Test-Path $SpeedtestLogPath)) {
    New-Item -Path $SpeedtestLogPath -ItemType Directory
}

# Download the speedtest.exe to the specified location
$SpeedtestUrl = "https://github.com/M3NTI0N/RMMScripts/raw/refs/heads/main/Tools/speedtest/speedtest.exe"
$SpeedtestFile = "$ToolsPath\speedtest.exe"
Invoke-WebRequest -Uri $SpeedtestUrl -OutFile $SpeedtestFile

# Run the speedtest and capture the output in JSON format
$speedtest = & $SpeedtestFile --format=json --accept-license --accept-gdpr
$result = ConvertFrom-Json $speedtest

# Write the results to the speedtest log file
Write-Output "Download speed: $([math]::Round($result.download.bandwidth / 1000000 * 8, 2)) Mbps" | Out-File "$SpeedtestLogPath\speedtest.txt"
Write-Output "Upload speed: $([math]::Round($result.upload.bandwidth / 1000000 * 8, 2)) Mbps" | Out-File "$SpeedtestLogPath\speedtest.txt" -Append
Write-Output "Packet loss: $([math]::Round($result.packetLoss))%" | Out-File "$SpeedtestLogPath\speedtest.txt" -Append
Write-Output "Ping Jitter: $([math]::Round($result.ping.jitter)) ms" | Out-File "$SpeedtestLogPath\speedtest.txt" -Append
Write-Output "Ping Latency: $([math]::Round($result.ping.latency)) ms" | Out-File "$SpeedtestLogPath\speedtest.txt" -Append
Write-Output "Provider:  $($result.isp)" | Out-File "$SpeedtestLogPath\speedtest.txt" -Append
Write-Output "Public IP:  $($result.interface.externalIp)" | Out-File "$SpeedtestLogPath\speedtest.txt" -Append
Write-Output "Private IP:  $($result.interface.internalIp)" | Out-File "$SpeedtestLogPath\speedtest.txt" -Append
Write-Output "Server Host:  $($result.server.host)" | Out-File "$SpeedtestLogPath\speedtest.txt" -Append
Write-Output "Result URL:  $($result.result.url)" | Out-File "$SpeedtestLogPath\speedtest.txt" -Append
