---
name: revize
description: Etkinlik günü açıklanan ya da değişen kurallara göre oturumu hızla günceller (Adım 8). Ne değişti tablosu, Şema 1'in yeni ölçütlerle değişmesi, yeniden puanlama, karar verenlerin uyarıları, fikrin hâlâ doğru olup olmadığı. Kullanıcı yeni kural, ölçüt ya da jüri bilgisi verdiğinde, oturumun hangi adımında olursa olsun kendiliğinden kullan.
argument-hint: "<değişen kural ya da yeni bilgi>"
---

# /mergen:revize

Önce oku: `${CLAUDE_PLUGIN_ROOT}/skills/surec/SKILL.md`, `${CLAUDE_PLUGIN_ROOT}/skills/puanlama/SKILL.md`.

Yeni bilgi: $ARGUMENTS

Bu komutta hız önemli: **önce sohbette kısa cevap, sonra dosya.** Durakta yalnız karar gerektiren maddeleri sor.

1. **Ne değişti tablosu.** `eskiden | şimdi | etkisi`.
2. **Şema 1'i değiştir.** Açıklanan ölçütler artık Şema 1'dir. Yeni "5 puan" ve "1 puan" tanımlarını onay beklemeden yaz ve "onaysız" diye işaretle. Fikir seçildiyse onu ve derin analizdeki diğer fikirleri, seçilmediyse üst sıradaki beş fikri Töre'ye yeniden puanlat. Zaman darsa tek tur yeter; bunu "tek tur" diye işaretle.
3. **Karar verenlerin uyarılarını uygula.** Öne çıkar dedikleri ve kaçının dedikleri şeyleri pitch'e, demoya ve kapsama işle. Hangi hazırlığın artık ikinci planda kaldığını söyle. Yeni jüri açıklandıysa Kam'ı çağırıp persona kartlarını güncelle.
4. **Fikir hâlâ doğru mu?** Değilse ortak iskeleti koruyarak hangi fikre geçileceğini öner.
5. **Kapsamı ve demo akışını güncelle.** Yeni sahne biçimine göre.
6. **Dosyayı güncelle.** "Önce bunlar" bölümünün en üstüne tarihli bir "kural değişikliği" notu ekle. `durum.md`'ye işle.
