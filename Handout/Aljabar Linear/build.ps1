# Jalankan dari direktori mana pun: & '.\Handout\Aljabar Linear\build.ps1'
# -cd membuat path Bab/ dan bookstyle/ relatif terhadap berkas utama.
$ErrorActionPreference = 'Stop'
$texMain = Join-Path $PSScriptRoot 'ONMIPA Alin.tex'
Get-Command latexmk -ErrorAction Stop | Out-Null
& latexmk -pdf -cd -interaction=nonstopmode -halt-on-error -file-line-error -synctex=1 $texMain
if ($LASTEXITCODE -ne 0) {
    throw "Kompilasi gagal (exit $LASTEXITCODE). Periksa ONMIPA Alin.log."
}
