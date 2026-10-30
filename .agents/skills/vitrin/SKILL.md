---
name: vitrin
description: "Bitmiş ya da bitmek üzere olan hackathon ürününü jüri gözüyle denetler. Yabancı yalnız README'yi ve ekran görüntülerini okuyup ürünü anlatır; Elçi repo, README, demo videosu, canlı adres, sunum ve teslim şartlarını denetler, Yabancı'nın anlatımını değer önerisiyle kıyaslar ve öncelikli düzeltme listesi verir. Kullanıcı ürününü, reposunu ya da README'sini gösterip \"bakar mısın\", \"teslime hazır mı\" dediğinde kendiliğinden kullan."
---

# $vitrin

Önce oku: `.agents/skills/surec/SKILL.md`.

Girdi: kullanıcının mesajı

Kulüp bir hackathonu ön elemede kaybetti: jüri "ürün, siz onu anlatmadan anlaşılmalı" dedi. Bu komut o jüriyi teslimden önce taklit eder.

## 1. Topla

- Repo (yerel yol ya da URL), README, ekran görüntüleri ve görseller, demo videosu linki, canlı adres, sunum dosyası (varsa).
- **Değer önerisi:** `durum.md`'de final fikrin tek cümlesi varsa onu al; yoksa kullanıcıya sor: "Bu ürünü tek cümleyle nasıl anlatıyorsunuz?"
- Teslim şartları ve Şema 1 ölçütleri: oturum varsa panodan; yoksa kullanıcıdan etkinlik linkini iste ve teslim sayfasını kendin oku.
- Oturum klasörü yoksa `mergen/vitrin-<repo-adi>/` aç.

## 2. Yabancı (30 saniyelik jüri)

**Yabancı**'yı (`yabanci`) çağır. Brifinge **yalnız** README metnini ve ekran görüntülerinin **yerel** dosya yollarını ver. Kod, değer önerisi, sunum, sohbet geçmişi verilmez. Görseller yalnız internette duruyorsa ve yerel kopyası yoksa Yabancı onları göremez: kullanıcıdan yerel kopya iste ya da testi yalnız metinle yap ve sonuçta "görseller görülmedi" diye belirt (jüri de görselleri açmadan karar verebilir; bu da bir sinyaldir). Yabancı şunu döner: ürün ne yapıyor ve kimin için (iki cümle), ilk 30 saniyede anlamadığı yerler, ilk ekranda gözüne çarpan.

## 3. Elçi (vitrin denetçisi)

**Elçi**'yi (`elci`) çağır. Brifinge şunları ver: repo, README, görseller, demo videosu ve canlı adres, sunum, değer önerisi, Yabancı'nın çıktısı, teslim şartları, Şema 1 ölçütleri, havuzdan `readme`, `demo`, `pitch`, `submission` aşamasındaki ilgili dersler ve itirazlar (kendi cümlelerinle), çıktı yolu `pano/vitrin-elci.md`.

## 4. Sonuç

Elçi'nin raporunu oku, kritik bulguları (canlı adres çalışıyor mu, teslim şartı eksik mi) kendin doğrula ve kullanıcıya şu biçimde ver:

1. **Karar:** Teslime hazır / Düzeltmeyle hazır / Hazır değil.
2. **Yabancı testi:** Yabancı'nın anlatımı ve değer önerisiyle uyuşma derecesi (tam / kısmen / uyuşmuyor) — en kritik bulgu bu.
3. **Öncelikli düzeltmeler:** en çok 7 madde, etki sırasıyla; her biri için somut metin ya da adım (örneğin README ilk ekranının yeniden yazılmış hali).
4. **Teslim şartları kontrolü:** `şart | durum | not`.
5. **Ölçüt eşleşmesi:** her Şema 1 ölçütü için "jüri bunu nerede görecek".

Düzeltmeler yapılınca kullanıcı isterse Yabancı testini tekrarla. Denetimde yeni bir ders çıktıysa `tecrube-karti` skill'ine göre kart öner.
