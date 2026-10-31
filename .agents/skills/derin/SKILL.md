---
name: derin
description: "Seçilen fikirlerin derin analizi ve final seçimi (Adım 5–6). Her finalisti karar verenlerin önüne çıkacakmış gibi sınar, jüri simülasyonu ve ikili karşılaştırma yapar, sonra seçilen fikri etkinliğe hazır hale getirir (mimari, kapsam, demo akışı, pitch, riskler, etkinlik öncesi testler). Fikir hunisinden sonra, kullanıcı finalistleri seçtiğinde ya da \"bu fikirleri derinlemesine incele\" dediğinde kendiliğinden kullan."
---

# $derin

Önce oku: `.agents/skills/surec/SKILL.md`, `.agents/skills/puanlama/SKILL.md`, `.agents/skills/juri/SKILL.md`.

Finalistler: kullanıcının mesajı (boşsa `durum.md`'de ve fikir hunisinin son turunda önerilen ya da kullanıcının seçtiği fikirler; varsayılan 3).

## Adım 5 · Derin analiz

Her finalist için Kayra'yı (`kayra`) derin analiz modunda çağır (finalistler paralel çağrılabilir); 1–9 ve 11–15. maddeleri o yazar. Zor sorular (madde 10) Kurultay'dan, geç aşama itirazları (16) Kurultay'ın itiraz modundan, tam puan tablosu (17) Töre'den gelir. Kayra'nın analizini kendin oku ve denetle: her madde var mı, sayılar kaynaklı mı, demo akışı sahne biçimine uyuyor mu. Eksikse bir kez geri gönder.

Her fikir için:

1. **Sıfırdan anlatım.** Jargonsuz, rakamlarla küçük bir örnek üzerinden. Her kavram ilk geçtiği yerde açıklanır.
2. **Problem ve kullanıcı.** Kim kullanır, kim öder.
3. **"Neden bu platform."** Somut sayılarla, en güçlü rakiple kıyaslayarak.
4. **Çekirdek döngü.** Alan profiline göre, fikrin kendi adımlarıyla. Zincir üstü uygulamada: işlemi kim, ne sıklıkla, neden atıyor; demoda gösterilecek canlı sayı. Otonom ajanda: ajanın döngüsü ve insanın nerede devrede olduğu. Fikirde olmayan adım eklenmez.
5. **Demo akışı.** Sahne biçimine ve süresine göre dakika dakika.
6. **Etkinlik içinde kanıt.** Gerçek kullanım kanıtı toplanabiliyor mu: kim kullanır, ekranda hangi sayı görünür? Mümkün değilse yerine ne gösterilir?
7. **Kapsam.** Çekirdek, olsa iyi olur, bilerek kapsam dışı bırakılanlar.
8. **Rakipler ve geçmiş benzerler.** Farkımız tek cümleyle.
9. **İş modeli ve yayılma.**
10. **Zor sorular ve cevapları.** Her jüri personasından en az iki soru (Kurultay'ın bu fikir için önceki çıktısı varsa ondan; yoksa Kurultay'ı (`kurultay`) `juri` protokolüyle çağır). "Neden kendileri yapmasın?", "X bunu zaten yapıyor" ve "bu olmadan da olmaz mıydı?" sorularını atlama.
11. **En kötü gün senaryosu ve B planı.** Demo çökerse, bağlantı koparsa ya da ortam sessizse ne gösterilir.
12. **Talep kanıtını güçlendirme.** Kullanıcısı olabilecek ekipleri ya da kişileri öncelik sırasıyla, hesaplarıyla listele. Satış yapmayan, yönlendirmeyen kısa bir soru taslağı yaz. Mesajı kullanıcı gönderir.
13. **Kendi verinle sınama.** Mümkünse temel iddiayı açık veriyle küçük bir hesapla sına; "kendi hesabım" diye işaretle, varsayımları yaz.
14. **Bonuslar ve ikincil hedef.** Bonus varsa planı; ikincil hedef yazılıysa uyumu tek satır (ikincil hedef fikri yönlendirmez).
15. **README'nin ilk ekranı.** Bu fikrin README'sinin ilk ekranı nasıl görünür: başlık, tek cümle, tek görsel ya da sahne tarifi, "nasıl denenir" satırı. Yabancı'ya (`yabanci`) yalnız başlığı ve görsel/sahne tarifini ver (tek cümleyi verme); anlatımı tek cümleyle uyuşmuyorsa düzelt ve yeniden dene. En çok iki yeniden yazım; yine uyuşmuyorsa bunu açıkça "anlatım riski" diye yaz.
16. **Geç aşama itirazları.** `demo`, `pitch`, `readme`, `submission`, `judging` aşamalı itirazları demo akışına, README ilk ekranına ve teslim planına uygula; Kurultay'ı itiraz modunda bu metinlerle çağır. Takılan yeri düzelt.
17. **İki şemada tam tablo.** Töre ile üç paralel, bağımsız turda (`puanlar/derin-tur1.md`, `-tur2.md`, `-tur3.md`); her boyut için orta değer, aralık ve gerekçe; en düşük iki boyut için yükseltme önerisi ve "önce → sonra".

Her fikrin analizi bitince dosyanın 15. bölümüne ekle; hepsi bitmeden yayınlamayı bekletme.

### İkili karşılaştırma

Bütün finalist çiftleri için `puanlama` bölüm 7'yi uygula: her çift iki sırayla, her sırada üç jüri personası (Kurultay, karşılaştırma modu) ve Töre (karşılaştırma modu) ayrı ayrı "hangisi ilk 3'e daha yakın" diye karar verir. Galibiyet tablosunu yaz. İkili sıralama puan sıralamasıyla çelişiyorsa bunu açıkça söyle.

### Kürsü kıyası

Her finalist için `puanlama` bölüm 10'u uygula: her kürsü projesiyle iki sırada Töre ve üç persona. Proje, dört değerlendiricinin en az üçü iki sırada da `fikir` derse geçilmiş sayılır. Fikir en az iki projeyi (kürsüde tek proje varsa onu) geçmeden "ilk 3'e girer" denmez. Son kararı kullanıcı verir; fikrin kürsüyü geçmediğini açıkça söyle. Hiçbir finalist geçemediyse huniye dönüp yeni tur öner (`fikir` bölüm 6). "Kürsü projesi neyi gösteriyor, fikrimiz neyi göstermiyor" cümlelerini ders defterine işle (`fikir` bölüm 5).

### Sonunda

- Fikirleri yan yana koyan tek tablo: iki puan (orta değer ve aralık), fren, jüri kararları, ikili karşılaştırma galibiyetleri, kürsü kıyası, Yabancı testi.
- **Dürüst görüşün:** hangisini seçerdin, neden. Kürsüyü geçmeyen fikre "ilk 3'e girer" deme. Puan ya da ikili sıralamayla ayrışıyorsa nedenini yaz. Örnek: bir fikri kullanıcıya anlatmak uzun açıklama gerektirdiyse karar verenlere de anlatmak zor olacaktır.

**Durakta istenecekler:** Finale hangi fikirle gidileceği; anlaşılmayan yerler; puan itirazları.

## Adım 6 · Final seçim

Seçilen fikri etkinliğe hazır hale getir:

1. **Neden bu fikir.** Gerekçe ve geride bıraktıklarına göre farkı.
2. **Mimari.** `parça | ne yapıyor | hazır mı, biz mi yazıyoruz` ve kullanılacak araçlar.
3. **Kapsam.** Çekirdek / olsa iyi olur / kapsam dışı.
4. **Demo akışı.** Sahne biçimine göre.
5. **30 saniyelik pitch.** Kopyalanabilir.
6. **Vitrin planı.** README'nin ilk ekranı (Adım 5.15'in son hali), demo videosu senaryosu, ekran görüntüleri listesi, teslim şartlarındaki her madde için kontrol satırı. Etkinlik günü ürün bitince `$vitrin` ile denetlenecek.
7. **Riskler ve önlemler.**
8. **Açık sorular ve "kural şöyle çıkarsa" tablosu.** Etkinlikte netleşmesi gereken sorular, olası cevapları ve her birinde ne yapılacağı.
9. **Etkinlik öncesi yapılacaklar ve testler.** `ne | nasıl | neyi kapatır`. Etkinlik önceden kod yazmayı yasaklıyorsa liste ona göre: hesaplar, anahtarlar, test bakiyesi, kâğıt üstünde tasarım, prova.
10. **İki şemada son durum.**

Dosyanın 15–17. bölümlerini doldur; `durum.md`'yi güncelle.

**Durakta istenecekler:** Fikre ve kapsama onay; sonra `$koc` (sunum hazırlığı) ve `$devir` (geliştirici prompt'u) önerisi.
