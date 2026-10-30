---
name: juri
description: "Mergen'in jüri simülasyonu yöntemi. Jüri persona kartının biçimi, Kurultay protokolü (üç persona, birbirinden habersiz, taze bağlam), sentez ve itiraz kütüphanesine besleme. Kam persona kartı yazarken, Mergen Kurultay toplarken okur."
---

# Jüri simülasyonu

Kulübün en büyük sorunu: yapay zeka 50 fikir veriyor, ekip "jüri bunu der" diyerek çoğunu eliyor. Jüri simülasyonu bu elemeyi kullanıcıya gelmeden önce, gerçek jüri bilgisine dayanarak yapar.

Temel ilke: **fikri üreten onu değerlendirmez.** Ajanlar kendi işlerini değerlendirirken iyimserdir; ayrı ve sert bir değerlendirici kurmak, üreticiye öz eleştiri öğretmekten çok daha güvenilirdir.

## 1. Persona kartı

Kam, her karar verici için bir kart yazar. Gerçek kişi bilinmiyorsa karar verenlerin türünden kart yazılır ve "tür personası" diye işaretlenir.

```markdown
### <Ad> · <kurum, rol>
- **Kaynak taraması:** son 6 ayda okunan paylaşım ve yazılar (linkler, tarih)
- **Neyi övüyor:** 2–4 madde, her biri kaynaklı
- **Neyden sıkılmış / neyi eleştiriyor:** 2–4 madde, kaynaklı
- **Geçmişte sunumlara sorduğu sorular:** (Adım 2'de doldurulur) kaynaklı
- **Bakış açısı:** yatırımcı / platform mühendisi / ürün / topluluk / akademik
- **Bu kişiyi ikna eden kanıt türü:** canlı kullanım, kod derinliği, pazar büyüklüğü, ekosisteme katkı...
- **Muhtemel ilk sorusu:** tek cümle
- **Kırmızı çizgisi:** bu kişinin bir fikri anında elemesine yol açacak şey (kaynaklı ya da "çıkarım")
```

Kaynaksız madde "çıkarım" ya da "varsayım" etiketi taşır. Kişi hakkında yalnız kendi herkese açık sözlerinden ve rolünden yola çıkılır; özel hayat ve kişisel veri yazılmaz.

Karar verenler bilinmiyorsa varsayılan üç tür personası kullanılır ve kullanıcıya söylenir:

| Persona | Merceği | Tipik sorusu |
|---|---|---|
| Yatırımcı | Para, büyüme, ekip | "Bunu kim, neden öder? İlk 100 kullanıcı nereden gelir?" |
| Platform mühendisi / DevRel | Platform derinliği, teknik doğruluk | "Bu neden bizim platformda? Rakipte neden olmaz?" |
| Ürün ve kullanıcı jürisi | Sorunun gerçekliği, akılda kalan demo | "Bu sorunu bugün kim, nasıl yaşıyor? Demoda ne hatırlayacağım?" |

Persona kartlarının tek geçerli hali `pano/personalar.md` dosyasıdır. Kam Adım 1'de bu dosyayı oluşturur, Adım 2'de ve jüri açıklanınca aynı dosyayı günceller (eski satırları silmeden, "güncellendi" notuyla). `pano/adim1-kam.md` ve `pano/adim2-kam.md` yalnız araştırma notlarıdır.

## 2. Kurultay protokolü

1. **Persona seçimi:** her fikir için üç persona kullanılır. Kam üçten fazla kart yazdıysa Mergen, kararı en çok etkileyen (baş jüri, ağırlığı yüksek oy) ve birbirinden farklı mercekleri olan üçünü seçer ve hangilerini neden seçtiğini `durum.md`'ye yazar. Bütün fikirler aynı üç personayla sorgulanır. **Kapsam:** seçilen küme her track'in ve her sıralı ödül kolunun alanını en az bir personayla kapsamalıdır. Kaynağı zayıf ama ortak düzenleyici ya da track alanının sahibi olan bir jüri üyesi için de tür personası kurulur (Kam) ve küme onu dışarıda bırakmaz; gerekirse persona sayısı dörde çıkar ve nedeni `durum.md`'ye yazılır.
2. Mergen her persona için ayrı bir Kurultay ajanı (`kurultay`) çağırır: fikir başına üç çağrı. Üçü paralel çalışır ve **birbirinin cevabını görmez**. Bu, birinin görüşünün diğerlerini sürüklemesini önler.
3. Her ajana yalnız şunlar verilir: persona kartı, fikir kartı (kısa kartın bütün satırları: tek cümle, kullanıcı, çekirdek döngü, ne inşa ediyoruz, primitif, tek sahne, demo anı, para ve yayılma, talep sinyali), hackathonun bir paragraflık özeti ve Şema 1 ölçütleri. Sohbet geçmişi, diğer fikirler ve Töre'nin puanları **verilmez**.
4. Her persona şu biçimde cevap verir:

```markdown
## <Persona> → <Fikir adı>
- **İlk izlenim (tek cümle):**
- **Soracağım 3 soru:** (1) ... (2) ... (3) ...
- **"Bunu neden isteyeyim?" cevabı kartta var mı, ikna edici mi:** evet / kısmen / hayır — neden
- **"Para nereden gelir?" cevabı yeterli mi:** evet / kısmen / hayır — neden
- **"X zaten yapıyor" itirazım:** varsa hangi ürün/proje; yoksa "yok"
- **En büyük itirazım:** tek cümle
- **Kararım:** geçer / şüpheli / eler — tek cümle gerekçe
- **Fikri benim gözümde yükseltecek tek değişiklik:**
```

   **Huni aşamasında** (çok fikir yan yana) karar üçlü değil ölçeklidir: persona her fikre 1–5 **güven puanı** verir; ayrıca brifingdeki dört fikir için göreli soru sorulur: "bu dört fikirden finalde ilk 3'e girecek olan hangisi?" (tek ad, tek cümle gerekçe). Seçimde üçlü karar (geçer/şüpheli/eler) ağırlık taşımaz; güven puanları ve göreli seçimler sayılır. İki simülasyonda 12 çağrı da aynı kararı ("şüpheli", "geçer") döndü ve ayırt etmedi; aynı personalar göreli soruyla ayırt etti. Derin analizde ve sunumda üçlü karar kalır.

5. Kurultay'ın cevaplarını Mergen `pano/kurultay-<huni|derin>.md` dosyasına fikir fikir yazar ve sentezler:
   - **Ortak itirazlar** (en az iki personada geçen) fikir kartının "Puanı düşürebilecekler" ve "Zor sorular" satırına girer.
   - Bir persona "eler" dediyse ve itirazı fikir kartında cevapsızsa fikir "jüri riski" işaretlenir.
   - Personaların önerdiği değişiklikler fikir varyantı adayı olarak not edilir. Bir öneri fikre ancak etkinlik şartından, kullanıcının tercihinden ya da araştırma bulgusundan doğuyorsa girer; hangisinden doğduğu yazılır. Persona önerisi tek başına ürün özelliği gerekçesi değildir. Fikri Kayra değiştirir (Mergen'in notuyla), persona değil.
   - Sentez, Töre'nin puanını değiştirmez; yeni bilgi çıkarsa yeniden puanlama kuralları (`puanlama` skill'i) uygulanır.

## 3. İtiraz ön filtresi

Fikri yazan Kayra'dır; fikirleri itiraz kütüphanesinden geçirme işi ondan bağımsız bir ajana verilir: Kurultay **itiraz modunda** çağrılır. Brifinge yalnız şunlar girer: geçerli itirazların listesi (kart numarası, başlık, test sorusu, aşama) ve fikirlerin kısa kartları. Kurultay her fikir için takıldığı itirazları tek cümle gerekçeyle **cevabında** döner; Kurultay'ın aracı yalnız Read'dir, dosya yazamaz. Sonucu Mergen `pano/` altına yazar (brifinge çıktı yolu verilmez).

- **Aşama süzgeci:** fikir hunisinde yalnız `idea`, `mvp`, `team`, `other` aşamalı itirazlar ve aşaması boş olanlar uygulanır. `demo`, `pitch`, `readme`, `submission`, `judging` aşamalı itirazlar derin analizde (demo akışı, README ilk ekranı, teslim planı) ve vitrin denetiminde uygulanır.
- Takılan fikir Kayra'ya düzeltme modunda gönderilir; somut bir tasarım değişikliğiyle düzeltilen fikir **bir kez** daha itiraz modunda kontrol ettirilir. Yine takılırsa "itirazla elendi" listesine girer.

## 4. İtiraz kütüphanesine besleme

Kurultay'da birden çok fikirde tekrar eden bir itiraz, kulüp için genel bir derstir. Mergen bunu oturum sonunda kullanıcıya **itiraz kartı önerisi** olarak getirir:

- Başlık: itirazın tek cümlelik hali.
- Test sorusu: herhangi bir fikre sorulabilecek evet/hayır sorusu. "Fikir, platform olmadan da aynı şekilde çalışıyor mu?"
- Kanıt: hangi personalar, hangi fikirlerde.

Kullanıcı onaylarsa `card_submit` ile `veto` türünde gönderilir ve karantinaya girer.
