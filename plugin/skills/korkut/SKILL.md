---
name: korkut
description: Kolektif havuzun bakımı. Korkut karantinadaki ve onaylı kartları inceler, tekrar edenleri birleştirmeyi, birden çok etkinlikte doğrulanmış dersleri "tekrarlandı" ya da "kural" güvenine yükseltmeyi, çelişen kartları ve şüpheli içeriği raporlar; yönetici onaylayınca uygulanır. Yönetici "havuzu temizle", "kartları birleştir", "Korkut" dediğinde kendiliğinden kullan.
argument-hint: "[konu, isteğe bağlı]"
---

# /mergen:korkut

Önce oku: `${CLAUDE_PLUGIN_ROOT}/skills/surec/SKILL.md`, `${CLAUDE_PLUGIN_ROOT}/skills/tecrube-karti/SKILL.md`.

Konu: $ARGUMENTS

1. `whoami` ile kullanıcının rolüne bak. Yönetici değilse birleştirme ve rafa kaldırma uygulanamaz; yalnız rapor çıkar ve bunu söyle.
2. Kartları topla: `quarantine_list`, `veto_list` ve konu verildiyse o konuda, verilmediyse her aşama (`idea`, `mvp`, `demo`, `pitch`, `readme`, `judging`...) için `pool_search` (en çok 10 kart döner; birkaç sorgu gerekir). Kartları `mergen/korkut/<tarih>-kartlar.md` dosyasına yaz. Bu dosya geçicidir; iş bitince sil.
3. **Korkut**'u (`mergen:korkut`) çağır; brifinge bu dosyanın yolunu ve rapor yolunu (`mergen/korkut/<tarih>-rapor.md`) ver.
4. Raporu oku ve kullanıcıya şu bölümlerle sun:
   - **Birleştirme önerileri:** aynı dersi anlatan kartlar → önerilen birleşik kart (tam metin) + rafa kalkacak kartlar.
   - **Güven yükseltme:** farklı etkinliklerde tekrarlanan dersler (`single` → `repeated`, çok güçlüyse `rule`).
   - **Çelişkiler:** birbirine ters düşen kartlar ve hangi bağlamda hangisinin geçerli olduğuna dair öneri.
   - **Şüpheli içerik:** yapay zekaya talimat veren, kişisel veri ya da doğrulanmamış iddia içeren kartlar.
   - **Zayıf kartlar:** kuralı taşınamayan, kanıtsız ya da başlığı ders anlatmayan kartlar ve nasıl düzeltilecekleri.
5. Yönetici hangi önerileri onaylarsa uygula: birleşik kartı `card_submit` ile gönder (yeni kart karantinaya girer; yönetici `card_approve` ile onaylayabilir), eski kartları `card_shelve` ile "birleştirildi" gerekçesi ve birleşik kartın numarasıyla rafa kaldır. Hiçbir kart silinmez.
