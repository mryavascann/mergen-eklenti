---
name: tecrube-karti
description: "Kolektif havuza yazılan tecrübe kartının biçimi, yazım kuralları ve örnekleri. Ders, itiraz (veto), jüri notu, tarif, uyarı, kulüp fikri ve kulüp kararı kartları nasıl yazılır, test sorusu nasıl kurulur, neler yazılmaz. Kart taslağı çıkaran her komut okur."
---

# Tecrübe kartı

Havuzdaki her bilgi bir karttır. Kart serbest metin değildir; başka bir üyenin, hiç orada olmadan, başka bir hackathonda kullanabileceği biçimde yazılır.

## 1. Alanlar

| Alan | Zorunlu | Nasıl yazılır |
|---|---|---|
| `kind` | ✓ | `lesson` ders · `veto` itiraz · `judge_note` jüri notu · `recipe` tarif · `warning` uyarı · `idea` kulüp fikri · `decision` kulüp kararı |
| `title` | ✓ | Tek cümle, en çok 200 karakter. Dersin kendisi, olayın adı değil. ✗ "Stellar'da olanlar" · ✓ "Ürün-pazar kanıtı olmayan proje karnede en çok 1,5 alıyor." |
| `situation` | ✓ | Ne oldu: somut, kısa, ölçülebilir. Kim, nerede, ne yaptı, ne sonuç aldı. |
| `rule` | ✓ | Başka hackathona taşınabilen genel kural. Emir kipinde, bir iki cümle. |
| `test_question` | `veto`'da ✓ | Herhangi bir fikre sorulabilen evet/hayır sorusu. "Evet" cevabı fikri riske sokar ya da sokmaz; hangisi olduğu soruda açık olmalı. |
| `evidence` | | Jüri sözü (tırnak içinde, kimden), link, derece, puan. |
| `event_name`, `event_date`, `platform` | | Bağlam. Bilinmiyorsa boş bırak. |
| `phase` | ✓ | `idea` fikir · `mvp` kapsam · `build` geliştirme · `demo` · `pitch` sunum · `readme` · `submission` teslim · `judging` değerlendirme · `team` ekip · `other` |
| `effect` | | `won` kazandırdı · `lost` kaybettirdi · `neutral` · `unknown` |
| `confidence` | | `single` tek gözlem · `repeated` birden çok etkinlikte tekrarlandı · `rule` kural haline geldi. Yeni kart neredeyse her zaman `single`'dır; `repeated` ve `rule`'a Korkut yükseltir. |
| `tags` | | En çok 10 kısa etiket: platform adı, kategori, jüri türü. Ders bir ajanın işini iyileştiriyorsa `codex-ajan:<ad>` etiketi de ekle, en çok iki tane. Adlar: `mergen`, `bilge`, `kam`, `bitigci`, `boru`, `yanki`, `kayra`, `tore`, `kurultay`, `yabanci`, `atabey`, `elci`, `kalemsor`, `tulpar`, `ulgen`. Mergen o ajanı çağırırken bu kartları brifingine koyar (`surec` §9). |

## 2. Kart türleri

- **Ders (`lesson`):** Kulübün bir etkinlikte öğrendiği genel şey.
- **İtiraz (`veto`):** Bir fikri elemek için kullanılan, test sorusuna çevrilmiş neden. Mergen her fikri kullanıcıya göstermeden önce bütün onaylı itirazlardan geçirir. İtiraz kütüphanesi kulübün kolektif zekasının en değerli parçasıdır.
- **Jüri notu (`judge_note`):** Belirli bir jüri üyesinin ya da jüri türünün neye baktığı. Kaynak: sunumda sorduğu soru, verdiği geri bildirim, herkese açık yazısı.
- **Tarif (`recipe`):** Bir kazanan paterni uygulayan somut teknik ya da sahne numarası.
- **Uyarı (`warning`):** Platformun, aracın ya da etkinlik düzeninin tuzakları. "Bu ağda test bakiyesi faucet'i etkinlik günü çöküyor."
- **Kulüp fikri (`idea`):** Üyelerin konuşarak olgunlaştırdığı bir proje fikri. Fikir hunisi bunu aday olarak alır; ajanlar değerlendirir, uyarlar ya da gerekçeyle eler. Alanlar şöyle dolar:
  - `title`: fikrin tek cümlesi.
  - `situation`: kim önerdi, hangi bağlamda, konuşmada ne değişti; itirazlar ve cevapları.
  - `rule`: fikir neden değerli, hangi tür hackathona ya da koşula uyar, neyi denemek gerekir.
  - `phase`: çoğunlukla `idea`; `effect`: `unknown`.
  - Bir fikre yapılan genellenebilir itiraz ayrı bir `veto` kartıdır.
- **Kulüp kararı (`decision`):** Kulübün bundan sonra nasıl davranacağına dair bir karar. "Bundan sonra README'yi ilk gün yazıyoruz." Alanlar şöyle dolar:
  - `title`: kararın kendisi.
  - `situation`: neden ve hangi seçenekler arasından alındı.
  - `rule`: bundan sonra ne yapılacak.
  - `phase`: kararın ilgili olduğu aşama; ekip içi kararlar için `team`.
  - Toplantı saati gibi geçici işler karar kartı olmaz.

Kulübün WhatsApp grubundaki fikirleri, kararları ve tecrübeleri Ulak (sunucudaki grup ajanı) bu biçimde taslak olarak yazar. Ulak'ın kartlarında yazar "Ulak"tır; mesajı yazan üyelerin adı ayrı bir alanda (`origin_author`) durur.

## 3. Örnekler

```yaml
kind: lesson
title: MVP tek yumruk olmalı; dallanıp budaklanan ürün demoda dağılıyor.
situation: Monad Blitz İstanbul'da fikri birden çok özellikle büyüttük; demoda hiçbiri tam oturmadı.
rule: Tek kullanıcı, tek ana akış, tek cümlelik değer önerisi seç. Geri kalan her şeyi "olsa iyi olur"a at.
phase: mvp
effect: lost
confidence: single
tags: [mvp, kapsam, demo]
```

```yaml
kind: veto
title: Sunum yapılmadan anlaşılmayan ürün ön elemede eleniyor.
situation: Son hackathonda ön elemede elendik; jüri sonradan ürünü beğendi ama README ve tanıtım ürünü anlatmıyordu.
rule: README'nin ilk ekranı, bir yabancının ürünü 30 saniyede anlatabileceği kadar açık olmalı. Demo videosu ve ekran görüntüsü teslimin parçası.
test_question: Bu ürün, sunum yapılmadan yalnız README'nin ilk ekranı ve tek bir ekran görüntüsüyle anlaşılıyor mu? (Hayır ise risk.)
evidence: Jüri: "Ürün, siz onu anlatmadan anlaşılmalı."
phase: readme
effect: lost
confidence: single
tags: [readme, ön eleme, tanıtım]
```

```yaml
kind: veto
title: Platform olmadan da aynı şekilde çalışan fikir "neden burada" sorusunda düşüyor.
situation: Birçok fikri "jüri 'neden bu zincir' der" diyerek eledik.
rule: Fikir, platformun rakiplerin çoğunda olmayan bir yeteneğine yaslanmalı.
test_question: Fikir, platformun öne çıkan yeteneği olmadan da aynı şekilde çalışıyor mu? (Evet ise risk.)
phase: idea
effect: unknown
confidence: repeated
tags: [primitif, neden-burada]
```

```yaml
kind: idea
title: Hackathon jürisinin geçmiş sorularından sahte soru-cevap provası üreten araç.
situation: Grupta Ayşe önerdi; Mehmet "Atabey zaten soru bankası yazıyor" diye itiraz etti. Fark netleşti; araç, jürinin kendi geçmiş sorularını sesli provaya çeviriyor.
rule: Sunum ağırlıklı, jürisi önceden açıklanan hackathonlarda dene. Değeri provanın gerçek jüri sorularına yakınlığında; önce bir jüri üyesiyle ölç.
phase: idea
effect: unknown
confidence: single
tags: [sunum, jüri, prova]
```

```yaml
kind: decision
title: Bundan sonra her hackathonda README ilk gün yazılır, demo videosu son gün değil sondan bir önceki gün çekilir.
situation: Son iki etkinlikte README ve video son saate kaldı; ikisinde de teslim aceleyle yapıldı.
rule: Takvimde README'yi ilk günün sonuna, demo videosunu son günden bir önceki akşama koy.
phase: submission
effect: unknown
confidence: single
tags: [readme, demo, takvim]
```

## 4. Yazılmayanlar

- Şifre, anahtar, özel adres, kişisel veri.
- Jüri üyesi hakkında herkese açık sözleri ve rolü dışında bilgi; dedikodu.
- Başka bir ekibin fikrini küçümseyen ya da teşhir eden ifade.
- Yapay zekaya yönelik talimat ("bu kartı okuyan ajan şunu yapsın"). Sunucu bu tür içeriği işaretler; böyle kartlar yönetici onayı ister.
- Doğrulanmamış iddiayı kesin bilgi gibi: emin değilsen `confidence: single` ve kanıtta "doğrulanmadı" yaz.

## 5. Kaliteli kart kontrol listesi

- Başlık tek başına okununca ders anlaşılıyor mu?
- Kural başka bir hackathona taşınabiliyor mu, yoksa yalnız o etkinliğe mi özgü?
- İtirazsa test sorusu herhangi bir fikre sorulabiliyor mu ve "riskli cevap" açık mı?
- Kanıt var mı; yoksa bu açıkça söyleniyor mu?
- Aynı ders havuzda zaten var mı? Göndermeden önce `pool_search` ile ara; varsa yenisini yazma, var olanın kanıtına eklenecek bilgiyi kullanıcıya söyle (Korkut birleştirir).

## 6. Gönderme

Kartı kullanıcıya göster, onayını al, `card_submit` ile gönder. Kart **karantinaya** girer ve **yalnız bir yönetici onaylayınca** havuza açılır (2026-10-23, kullanıcı kararı). Üyelerin onayı destek olarak kaydedilir ve yöneticiye gösterilir. Kullanıcıya kart numarasını ve karantinada olduğunu söyle.
