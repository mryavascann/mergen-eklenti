---
name: koc
description: Sunumu yapacak kişiyi etkinliğe hazırlar (Adım 7). Atabey seçilen fikir için çalışma kartı yazar (klasik hackathon soruları, platform primitifleri, "kafana kazı" kartları, zor sorular, pitch, sunum iskeleti); ardından Mergen kullanıcıyı jüri personalarının ağzından test eder. Final fikir seçildikten sonra ya da kullanıcı sunuma çalışmak, pitch'i prova etmek, "beni test et" demek istediğinde kendiliğinden kullan.
argument-hint: "[test | kart]"
---

# Sunum koçluğu

Önce oku: `${CLAUDE_PLUGIN_ROOT}/skills/surec/SKILL.md`.

Mod: $ARGUMENTS (boşsa: kart yoksa önce kart, varsa test).

## Çalışma kartı

`durum.md`'de final fikir yoksa dur ve derin analizi (`derin` skill'i) öner.

Atabey'i (`mergen:atabey`) çağır. Brifinge şunları ver: final fikir kartı, Adım 5–6 çıktıları (demo akışı, pitch, zor sorular — yeniden üretilmez, son hali kullanılır), iki şemadaki son durum, primitif tablosu, organizatör ve karar veren vurguları, talep sinyalleri, `pano/personalar.md`, havuzdan ilgili jüri notları ve dersler (kendi cümlelerinle), takımın iyi bildiği platformlar (`durum.md`), çıktı yolu `mergen/<kisa-ad>/calisma-karti.html`.

Atabey'in kartı şunları içerir:

**A. Klasik hackathon soruları** (her biri şeytanın avukatlığıyla; en zayıf nokta saklanmaz)
1. Bu neden bu platformda olmak zorunda? Onsuz aynı iş yapılamaz mı?
2. Neden bu platform, neden rakibi değil? Kullanıcı nereden gelecek?
3. Çekirdek aksiyon nasıl gerçekleşiyor: kim, ne sıklıkla, neden? Organik mi?
4. Teknik derinlik nereden geliyor?
5. Hangi primitifleri kullanıyor? Her biri için: çekirdek / kullanıcı deneyimi / yönetilmesi gereken kısıt / kullanılmıyor.
6. Tarif defterinden neler kullanılıyor; geçmiş kazananlara göre artı ve eksiler.

**B. Yedi soru**
1. Şema 1'in her ölçütü: karar verenlere nasıl anlatılır ve 5 üzerinden kaç alınır.
2. Organizatörün ve karar verenlerin vurgularından hangilerine dokunuyor, hangilerine dokunmuyor.
3. "Kafana kazı" kartları: platform hakkında ezbere bilinmesi gereken genel kültür; kullanılan primitifler.
4. Problem, çözüm ve kullanılan tarifler.
5. Adım 3'teki şikâyet ve talep sinyallerinden hangisine dokunuyor; dokunmuyorsa dürüstçe.
6. İki şemada son durum.
7. Şemaların dışında, her şeyi göz önüne alarak 5 üzerinden genel puan ve kazanma ihtimali: taban oran (ödül sayısı / beklenen proje sayısı), iyi uygulanırsa, demo aksarsa. Kişisel tahmin olduğu belirtilir. İhtimali en çok artıracak üç şey.

**C. Ekler:** platforma özgü kavramlar için günlük hayattan benzetmeler ve takımın bildiği bir platformla karşılaştırma; sunum iskeleti (slayt sırası ya da video sahneleri, sürelerle); 30 saniyelik pitch; zor soru-cevap listesi; test için soru bankası (en az 20 soru, persona ve konuya göre etiketli).

Kartı oku, eksik bölüm varsa Atabey'e tamamlat. Sonra sen yayınla: çalışma dosyasından ayrı bir sayfa, "<Etkinlik kısa adı> Çalışma Kartı". Sayfa yayınlama aracı yoksa yerel dosya yolunu ver. Adresini `durum.md`'ye yaz.

**Durakta istenecekler:** Anlaşılmayan kartlar; düşük bulunan puanlar için tasarım önerileri; teste ve geliştirici prompt'una (`devir` skill'i) geçiş.

Bir puan düşük çıkarsa ve kullanıcı bir tasarım değişikliği önerirse: değerlendir, işe yarıyorsa uygula, "önce → şimdi" tablosuyla Töre'ye yeniden puanlat.

## Test

Testi sen (ana oturum) yürütürsün; çok turlu soru-cevap alt ajanla yapılamaz.

- Soru bankasından ve persona kartlarından her seferinde **tek soru** sor; bir personanın ağzından ("Platform mühendisi soruyor: ...").
- Cevabı üç ölçüyle değerlendir: doğru mu, eksiksiz mi, jüriyi ikna eder mi. Kısa düzeltme ve daha güçlü bir cevap örneği ver.
- Kullanıcının zorlandığı konuya bir soru daha ile dön.
- 8–10 sorudan sonra özet: güçlü konular, tekrar çalışılacaklar. Kartta zayıf konuları "tekrar" diye işaretle.
