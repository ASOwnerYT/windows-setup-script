$downloadUrl = "https://github.com/Romanitho/Winget-AutoUpdate/releases/latest/download/WAU.zip"
$zipFile = "$PWD\WAU.zip"
$extractPath = "$PWD\WAU"
$installScript = "$extractPath\install.bat"

# Download the ZIP file
Invoke-WebRequest -Uri $downloadUrl -OutFile $zipFile

# Create a new folder for extraction
New-Item -ItemType Directory -Path $extractPath

# Extract the ZIP file contents
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipFile, $extractPath)

# Clean up the downloaded ZIP file
Remove-Item -Path $zipFile

# Confirm the download completion
Write-Host "WAU downloaded. Starting installation now. Files are located in: $extractPath"

# Run the install.bat script
Start-Process -FilePath $installScript -WorkingDirectory $extractPath

# Confirm the WAU installation completion and download recommended applications
Write-Host "WAU installed. Starting download of recommended applications.."

winget install -e --id Google.Chrome;winget install -e --id Mozilla.Firefox;winget install -e --id Giorgiotani.Peazip;winget install -e --id TheDocumentFoundation.LibreOffice;winget install -e --id VideoLAN.VLC;winget install -e --id CodecGuide.K-LiteCodecPack.Standard
