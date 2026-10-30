---
name: calisma-dosyasi
description: "Hackathon oturumunun çalışma dosyası. Tek sayfanın biçimi, yukarıdan aşağı iskeleti, güncelleme kuralları ve yayınlama. Mergen dosyayı açarken ve her adımda güncellerken okur."
---

# Çalışma dosyası

Oturumun asıl çıktısı. Kullanıcı ve takım araştırmayı sohbetten değil buradan okur; etkinlik günü de buradan bakar. Dosya sohbetin kopyası değildir: kesinleşmiş hali taşır, yazışmayı taşımaz.

## 1. Biçim

- Tek bir HTML sayfası. Yerel kaynağı `mergen/<kisa-ad>/dosya.html`.
- Sayfa yayınlama aracın varsa yayınla ve **her adımda aynı adresi** güncelle; adresi `durum.md`'ye yaz. Yoksa yerel dosyayı tut ve kullanıcıya yolunu söyle.
- Adı: "<Etkinlik kısa adı> Dosyası".
- Adım 1'in sonunda açılır. Çalışma kartı (`$koc`) ayrı bir sayfadır.
- Telefonda okunabilir, açık ve koyu temada düzgün. Yayınladıktan sonra sayfayı açıp gözünle kontrol et; edemediysen söyle.
- Sayfa yalnız kullanıcıya açıksa takımın görebilmesi için ne yapması gerektiğini söyle.
- Havuz kartlarının metnini sayfaya kopyalama; "havuz kartı `#kısa-id`" diye an ve kendi cümlelerinle özetle.

Örnek: kulübün Monad Blitz İstanbul için yaptığı dosya: https://claude.ai/artifact/ArM6aMkmAgL57UCHhBEHv3 — bölüm düzeni, kart biçimleri, adım çipleri ve anlatım düzeyini görmek için aç; satır satır okuman gerekmez. İçeriği o hackathona aittir; bulgularını ve fikirlerini yeni oturuma taşıma. Açamazsan aşağıdaki tarif yeterli.

## 2. İskelet (yukarıdan aşağı)

1. **Başlık bandı.** Üstte "Takım dosyası · etkinlik · yer"; büyük başlık; bu sürümde ne olduğunu anlatan tek paragraf; güncelleme tarihi ve sürüm; etkinlik tarihi; taranan veri (kaç proje, kaç etkinlik). Altında adım çipleri: biten adım "✓", sıradaki vurgulu.
2. **İçindekiler.** Numaralı; geniş ekranda yanda sabit.
3. **Önce bunlar.** Planı değiştiren bulgular; her biri etiketli kart: kalın tek cümle bulgu, ardından sonucu. Etiketler: Kural, Ölçüt, Karar verenler, Kaçın, Uyarı, Fırsat, Talep, Düzenleme, Havuz. Sonradan eklenen kartta "Adım N'de eklendi".
4. **Kurallar ve puanlama.** Takvim, ölçütler, bonuslar, yayımlanmayanlar ve emsal, karar verenlerin mercekleri, "stratejik sonuç" notu.
5. **Karar verenler ve jüri personaları** (Kam).
6. **Primitifler** (Adım 1). Primitif tablosu, gerçekte ne çalışıyor, iddia doğrulama, tasarım kısıtları, organizatör sinyali, dürüst konumlama.
7. **Geçmiş projeler** (Adım 2). Etkinlikler, kazananlar, kalıplar, paternler, boşluk haritası, "karar verenler bunu gördü" listesi.
8. **Vaka analizleri ve tarif defteri.** Birincinin tam vakası; diğer kazananlar açılır-kapanır kartlarda.
9. **Talep sinyali** (Adım 3). Platformun fotoğrafı büyük sayılarla; boşluklar; başka yerde tutmuş ürünler; şikâyetler; tarihsel cephane; düzenleme notu.
10. **Havuzdan gelenler.** Bu oturumda kullanılan kulüp dersleri ve itirazları (özetle, kart numarasıyla).
11. **Soru taslakları.** Kopyala düğmeli; gelen cevaplar burada.
12. **Skor kartı.** Alan profili; iki şema, tanımları ve ağırlıklarıyla; kulüp karnesi; kalibrasyon; onay durumu; yeniden puanlama notları.
13. **Fikir hunisi.** Her tur ayrı bölüm: çekilen yeni veriler, itiraz ön filtresi sonucu, puan tablosu (orta değer ve aralık), fikir kartları, jüri simülasyonu özetleri, aileler, elenenler, katmanlar, ortak iskelet, turun önerisi.
14. **Açıklama bölümleri.** Kullanıcının "anlamadım" dediği konular için "X'i anlamak".
15. **Seçilen fikirlerin analizi** (derin analiz) ve **ikili karşılaştırma**.
16. **Final.**
17. **Etkinlik öncesi yapılacaklar ve testler.**
18. **Erişilemeyenler ve doğrulanamayanlar.**
19. **Alt not.** Etiketlerin anlamı ve verinin çekildiği tarihler.

## 3. Kurallar

- **Hiçbir şey silinmez.** Eskiyen tur "kenarda duruyor", bırakılan fikir "rafa kaldırıldı" diye işaretlenir ve nedeni yazılır. Puan değişiklikleri tarihli notla durur.
- **Baştan yazma, bölüm düzenle.** Her güncellemede yerel kaynakta yalnız ilgili bölümü değiştir. Yeniden yayınlamadan önce bölüm ve fikir sayısını önceki sürümle karşılaştır; eksilen varsa geri koy.
- Her bölümün başında hangi adımda üretildiği yazar.
- Her iddianın yanında kaynak linki ya da etiket vardır.
- Durum ve sinyal gücü küçük renkli etiketlerle: güçlü / orta / zayıf, çalışıyor / test gerekli / sorunlu, boş / kalabalık / kaçın, belirsiz puan.
- Her adımın sonunda dosyada "Senden istediklerim" kutusu olur; durak mesajındakiyle aynı liste.
