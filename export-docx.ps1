<#
.SYNOPSIS
    Експортує текст звернення (README.md) у Word-документ zvernennya.docx.
.NOTES
    Потрібен pandoc: winget install --id JohnMacFarlane.Pandoc -e
#>
$ErrorActionPreference = 'Stop'

if (-not (Get-Command pandoc -ErrorAction SilentlyContinue)) {
    Write-Error "pandoc не знайдено. Встановіть: winget install --id JohnMacFarlane.Pandoc -e"
}

pandoc README.md -o zvernennya.docx --metadata title="Колективне звернення до команди СвітлоБот"
Write-Host "Готово: zvernennya.docx" -ForegroundColor Green
