---
name: devir
description: "Seçilen fikri kodlayacak ayrı bir geliştirici ajana verilecek, kendi başına yeterli devir prompt'unu Kalemşor'a yazdırır (Adım 9). Fikir, teknoloji yığını, platform tuzakları, doğrulanmış veriler, mimari, kapsam, güvenlik ve test, bütçe, teslim listesi, README ve vitrin şartları. Final fikir onaylandıktan sonra, kullanıcı geliştirmeye geçmek istediğinde ya da \"kodlamaya başlayalım\" dediğinde kendiliğinden kullan."
---

# $devir

Önce oku: `.agents/skills/surec/SKILL.md`.

`durum.md`'de onaylı final fikir yoksa dur ve `$derin` öner.

**Kalemşor**'u (`kalemsor`) devir modunda çağır. Brifinge şunları ver: final fikir kartı ve Adım 5–6 çıktıları, primitif tablosu ve "gerçekte ne çalışıyor" bulguları, tasarım kısıtları, geçmiş projelerden dersler, etkinlik kuralları ve teslim şartları, havuzdan ilgili uyarı ve tarif kartları (kendi cümlelerinle), vitrin planı, çıktı yolu `mergen/<kisa-ad>/devir-promptu.md`.

Prompt şunları içerir:

1. **Fikir ve odak.** Tek cümle, kullanıcı, demo senaryosu, karar verenlerin baktığı şeyler. "Demoda ya da videoda görünmüyorsa yapma" kuralı.
2. **Teknoloji yığını.** Araçlar ve okunacak doküman linkleri.
3. **Platforma özgü kurallar ve tuzaklar.** Tasarım kısıtları ve geçmiş projelerden çıkan dersler.
4. **Doğrulanmış veriler.** Adresler, parametreler, uç noktalar, sürümler; kaynağıyla. Ajanın tahmin etmemesi gereken her şey.
5. **Mimari.** Parçalar, veri hattı ve her riskli parça için B planı.
6. **Kapsam ve sıra.** Çekirdek / olsa iyi olur / kapsam dışı. Saat içermeyen, sıralı kilometre taşları; "bir öncekini bitirmeden sonrakine geçme" kuralı.
7. **Güvenlik ve test.** Erişim kontrolü, girdi sınırları, sırların saklanması. Testler önce yazılır; hepsi yeşil olmadan commit, deploy ya da "bitti" yok.
8. **Bütçe ve kota.** Test bakiyesi, işlem ücreti, API kotası gibi harcanınca geri gelmeyen şeyler.
9. **Etkinlik kuralları ve teslim listesi.** Önceden yazılmış kod kuralı dahil.
10. **README ve vitrin.** README ilk ekranı (vitrin planındaki son hali), "nasıl denenir" bölümü, canlı adres, demo videosu ve ekran görüntüleri teslimin parçasıdır; README kodla birlikte güncel tutulur. Kulüp bir hackathonu README yüzünden ön elemede kaybetti.
11. **Yapma listesi.**
12. **Ortam değişkenleri.** Anahtarlar prompt'a ve repoya yazılmaz; nereye konacakları tarif edilir.

Kalemşor prompt'u bitirince kendine sorar: "Benim bildiğim ama yeni ajanın bilmeyeceği ne var?" Bulduklarını "Önceki araştırmadan kritik bilgiler" başlığıyla ekler. Strateji, diğer fikirlerin puanları ve sunum taktikleri gibi geliştiricinin işine yaramayacakları bilerek dışarıda bırakır ve neyi bıraktığını listeler.

Anlatı işleri (pitch, sunum, video metni) Mergen oturumunda kalır; geliştirici ajan karışmaz.

Prompt'u kendin oku; eksik ya da çelişkili yer varsa Kalemşor'a düzelttir. Sonra kullanıcıya dosya yolunu ver.

**Durakta istenecekler:** Prompt'a girecek anahtarların ve adreslerin nereden geleceği; dışarıda bırakılanlara itiraz.
