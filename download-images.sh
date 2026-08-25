#!/usr/bin/env bash
# Завантажує всі зображення сайту "Welcome to Yojji" з Cloudinary у теку ./images
# Запуск:  bash download-images.sh
set -u
mkdir -p images
fail=0

get() {
  local url="$1" name="$2"
  if [ -s "images/$name" ]; then
    echo "•  вже є        $name"
    return
  fi
  if curl -fsSL --retry 3 --retry-delay 2 -o "images/$name" "$url"; then
    echo "✓  завантажено  $name  ($(du -h "images/$name" | cut -f1))"
  else
    echo "✗  ПОМИЛКА      $name"
    rm -f "images/$name"
    fail=$((fail+1))
  fi
}

get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787290934/3896ADA8-8BD8-493F-8E6D-99A45F50061F_ttua3d.jpg" "team-photo-wide.jpg"
get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787291866/VAS_3953_5_rbswqw.png" "about-01-process.png"
get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787303145/VAS_3953_3_bjdkzy.png" "about-02-studio.png"
get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787291866/VAS_3953_3_igi60p.png" "about-03-people.png"
get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787292035/l_makarovsky_e8c2ea5d73_2_buibov.png" "leader-artem-makarovsky.png"
get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787292037/Rectangle_2060_mm03mj.png" "leader-timofey-lebedev.png"
get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787292034/Rectangle_5063_vjsxgy.png" "leader-yevhen-piotrovskyi.png"
get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787292033/Rectangle_2059_lkh1wl.png" "leader-ildar-kulmuhametov.png"
get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787293846/photo_2022-02-13_16.27.07_1_ducldz.png" "life-01-english-club.png"
get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787293843/Screenshot_2026-04-28_at_11.17.46_3_htsbb3.png" "life-02-learning.png"
get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787293843/telegram-cloud-document-2-5354835323366970847_1_driiyu.png" "life-03-reading-club.png"
get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787293842/Screenshot_2026-04-28_at_11.14.42_1_cw30zg.png" "life-04-team-moment.png"
get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787302946/c4fbb864-bc80-4862-9a23-8bef0120ebac_2_ribigt.png" "case-study-hall.png"
get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787302946/image_11478_no068n.png" "case-payosu.png"
get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787302945/Group_1_rfiv5p.png" "case-superme.png"
get "https://res.cloudinary.com/cztrkhn8/image/upload/v1787302943/MacBook_Air_2022_1_zph2lu.png" "case-jellibeans.png"

echo
echo "Файлів у ./images: $(ls -1 images | wc -l | tr -d ' ') із 16"
if [ "$fail" -gt 0 ]; then
  echo "Не вдалося завантажити: $fail. Перевірте, чи посилання Cloudinary ще живі."
  exit 1
fi
echo "Готово. Тепер завантажте на хостинг index.html і теку images/ разом."
