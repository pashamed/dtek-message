<#
.SYNOPSIS
    Імпортує правки з zvernennya.docx (Word) назад у zvernennya.md.
.DESCRIPTION
    Усі відстежувані зміни (Track Changes) приймаються автоматично.
    Після імпорту перегляньте diff: git diff zvernennya.md
.NOTES
    Потрібен pandoc: winget install --id JohnMacFarlane.Pandoc -e
#>
$ErrorActionPreference = 'Stop'

if (-not (Get-Command pandoc -ErrorAction SilentlyContinue)) {
    Write-Error "pandoc не знайдено. Встановіть: winget install --id JohnMacFarlane.Pandoc -e"
}
if (-not (Test-Path zvernennya.docx)) {
    Write-Error "zvernennya.docx не знайдено. Спершу створіть його: ./export-docx.ps1"
}

pandoc zvernennya.docx -t gfm --track-changes=accept --wrap=none -o zvernennya.md
Write-Host "Готово: правки з Word перенесено у zvernennya.md" -ForegroundColor Green
Write-Host "Перегляньте зміни: git diff zvernennya.md" -ForegroundColor Yellow
