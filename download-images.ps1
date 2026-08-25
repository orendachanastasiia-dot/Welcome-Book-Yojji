# Завантажує всі зображення сайту "Welcome to Yojji" з Cloudinary у теку .\images
# Запуск у PowerShell:  .\download-images.ps1
$ErrorActionPreference = "Continue"
New-Item -ItemType Directory -Force -Path "images" | Out-Null
$fail = 0

function Get-Img($url, $name) {
  $path = "images\$name"
  if (Test-Path $path) { Write-Host "•  вже є        $name"; return }
  try {
    Invoke-WebRequest -Uri $url -OutFile $path -UseBasicParsing
    Write-Host "✓  завантажено  $name"
  } catch {
    Write-Host "✗  ПОМИЛКА      $name"
    $script:fail++
  }
}

Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787290934/3896ADA8-8BD8-493F-8E6D-99A45F50061F_ttua3d.jpg" "team-photo-wide.jpg"
Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787291866/VAS_3953_5_rbswqw.png" "about-01-process.png"
Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787303145/VAS_3953_3_bjdkzy.png" "about-02-studio.png"
Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787291866/VAS_3953_3_igi60p.png" "about-03-people.png"
Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787292035/l_makarovsky_e8c2ea5d73_2_buibov.png" "leader-artem-makarovsky.png"
Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787292037/Rectangle_2060_mm03mj.png" "leader-timofey-lebedev.png"
Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787292034/Rectangle_5063_vjsxgy.png" "leader-yevhen-piotrovskyi.png"
Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787292033/Rectangle_2059_lkh1wl.png" "leader-ildar-kulmuhametov.png"
Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787293846/photo_2022-02-13_16.27.07_1_ducldz.png" "life-01-english-club.png"
Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787293843/Screenshot_2026-04-28_at_11.17.46_3_htsbb3.png" "life-02-learning.png"
Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787293843/telegram-cloud-document-2-5354835323366970847_1_driiyu.png" "life-03-reading-club.png"
Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787293842/Screenshot_2026-04-28_at_11.14.42_1_cw30zg.png" "life-04-team-moment.png"
Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787302946/c4fbb864-bc80-4862-9a23-8bef0120ebac_2_ribigt.png" "case-study-hall.png"
Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787302946/image_11478_no068n.png" "case-payosu.png"
Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787302945/Group_1_rfiv5p.png" "case-superme.png"
Get-Img "https://res.cloudinary.com/cztrkhn8/image/upload/v1787302943/MacBook_Air_2022_1_zph2lu.png" "case-jellibeans.png"

Write-Host ""
Write-Host ("Файлів у images: " + (Get-ChildItem images).Count + " із 16")
if ($fail -gt 0) { Write-Host "Не вдалося завантажити: $fail" }
else { Write-Host "Готово. Завантажте на хостинг index.html і теку images/ разом." }
