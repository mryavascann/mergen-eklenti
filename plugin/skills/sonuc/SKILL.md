---
name: sonuc
description: Hackathon bittikten sonra sonucu ve dersleri kolektif havuza geri yazar. Derece, jüri yorumları, ne iyi ne kötü gitti; bitmiş projenin sekiz boyutlu karne puanı (kulüp karnesi); oturumda doğan itirazlar ve dersler kart taslağı olarak; kullanılan havuz kartlarının bildirilmesi. Kullanıcı "hackathon bitti", "sonuç geldi", "kazandık/kaybettik" dediğinde kendiliğinden kullan.
argument-hint: "[etkinlik kısa adı]"
---

# /mergen:sonuc

Önce oku: `${CLAUDE_PLUGIN_ROOT}/skills/surec/SKILL.md`, `${CLAUDE_PLUGIN_ROOT}/skills/tecrube-karti/SKILL.md`, `${CLAUDE_PLUGIN_ROOT}/skills/puanlama/SKILL.md` (bölüm 2).

Etkinlik: $ARGUMENTS (boşsa `mergen/` altındaki en son oturum; emin değilsen sor).

Bu adım kolektif zekanın motorudur: her hackathon, sonraki hackathonun girdisi olur. Sonuç ne olursa olsun yap; kaybedilen hackathon en çok ders veren hackathondur.

## 1. Sonucu topla

`durum.md`'yi ve çalışma dosyasını oku. Kullanıcıya tek mesajda sor (bilinenleri yanına yaz):

- Derece (ya da hangi aşamada elendi)
- Jüri ne dedi: sorular, övgüler, eleştiriler; mümkünse kelimesi kelimesine ve kimden
- Ne iyi gitti, ne kötü gitti (ekibin kendi gözünden)
- Kazananlar kimdi, ne yapmışlardı (tek satır yeter)
- Bitmiş projenin repo ve demo linki

## 2. Kulüp karnesi kaydı

Bitmiş projeyi sekiz boyutta değerlendir: **Töre**'yi (`mergen:tore`) karne modunda çağır; brifinge repo/README/demo linklerini, jüri yorumlarını, dereceyi, Mergen'in etkinlik öncesi tahmin ettiği puanları ve karnenin önceki kayıtlarını (`scorecard_get`) ver. Töre bitmiş proje için `Boyut | Puan | Tek cümlelik gerekçe` tablosu çıkarır; ton `puanlama` skill'indeki ilk karne kaydıyla aynı.

Kullanıcıya göster, itirazlarını al.

## 3. Tahmin ile gerçeği karşılaştır

`puanlar.md`'deki etkinlik öncesi tahmini (seçilen fikrin Hackathon puanı ve kazanma ihtimali) gerçek sonuçla yan yana koy:

- Mergen nerede iyimserdi, nerede kötümserdi?
- Jüri personaları gerçek jürinin sorularını tahmin edebildi mi? (Kurultay'ın soruları ile jürinin soruları)
- Hangi itiraz ya da ders işe yaradı, hangisi yanılttı?

Bu bölüm ölçeğin kalibrasyonudur; `outcome_submit`'in `went_well` / `went_wrong` alanlarına kısa özetini koy.

## 4. Kart taslakları

Şu kaynaklardan kart taslağı çıkar (`tecrube-karti` biçiminde):

- Jüri yorumları → `judge_note` kartları (jüri üyesinin adı ve rolüyle; yalnız söyledikleri).
- Kötü gidenler → `lesson` ya da `veto` kartları.
- İyi gidenler ve kazananların numaraları → `recipe` kartları.
- Platform ve etkinlik tuzakları → `warning` kartları.
- `durum.md`'deki "Oturum itirazları"ndan havuza henüz gönderilmemiş olanlar → `veto` kartları.

Bir ders bir ajanın işini iyileştiriyorsa karta `ajan:<ad>` etiketini ekle. Örnek: Töre'nin puanı gerçek dereceden çok saptıysa `ajan:tore`; jüri, personaların sormadığı bir soru sorduysa `ajan:kam`. Oturumda çalışan ajanların karnesini de `durum.md`'nin "Sonuç" bölümüne yaz (`surec` §9).

Göndermeden önce her biri için `pool_search` ile tekrar kontrolü yap. Taslakları kullanıcıya göster, düzeltmelerini al.

## 5. Gönder

Kullanıcı onaylayınca:

1. `outcome_submit`: etkinlik adı, tarih, platform, fikir başlığı, derece, jüri yorumları, iyi/kötü gidenler, sekiz boyutlu karne puanları ve onaylanan kart taslakları (karantinaya girer).
2. `card_mark_used`: `durum.md`'deki "Kullanılan havuz kartları" listesi, her biri için nerede kullanıldığıyla. Kazandıysanız bağlama "kazanan fikir" yaz.
3. `durum.md`'ye "Sonuç" bölümü ekle; çalışma dosyasına kısa bir "Sonuç ve dersler" bölümü ekle.

Kullanıcıya özet: kaç kart karantinaya girdi, karnenin yeni en zayıf iki boyutu ne (`scorecard_get`), bir sonraki hackathonda dikkat edilecek üç şey.
