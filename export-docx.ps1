<#
.SYNOPSIS
    Експортує текст звернення (zvernennya.md) у Word-документ zvernennya.docx.
.DESCRIPTION
    Якщо поруч є template.docx — його стилі (шрифти, відступи, кольори)
    застосовуються до результату. Редагуйте стилі шаблону прямо у Word.
.NOTES
    Потрібен pandoc: winget install --id JohnMacFarlane.Pandoc -e
#>
$ErrorActionPreference = 'Stop'

if (-not (Get-Command pandoc -ErrorAction SilentlyContinue)) {
    Write-Error "pandoc не знайдено. Встановіть: winget install --id JohnMacFarlane.Pandoc -e"
}

$opts = @('zvernennya.md', '-o', 'zvernennya.docx')
if (Test-Path template.docx) {
    $opts += '--reference-doc=template.docx'
}

pandoc @opts
Write-Host "Готово: zvernennya.docx" -ForegroundColor Green
