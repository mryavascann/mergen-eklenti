---
name: kart
description: Kullanıcının anlattığı bir hackathon tecrübesini kolektif havuza tecrübe kartı olarak yazar. Serbest anlatımı (sesle yazdırılmış olabilir) ders, itiraz, jüri notu, tarif, uyarı, kulüp fikri ya da kulüp kararı kartına çevirir, havuzda benzerini arar, onay alıp gönderir. Ayrıca karantinadaki kartları onaylamak için kullanılır. Kullanıcı "şunu havuza ekle", "bir ders öğrendik", "tecrübe kartı" ya da "onay bekleyen kartlar" dediğinde kendiliğinden kullan.
argument-hint: "[anlatım | onay]"
---

# /mergen:kart

Önce oku: `${CLAUDE_PLUGIN_ROOT}/skills/surec/SKILL.md`, `${CLAUDE_PLUGIN_ROOT}/skills/tecrube-karti/SKILL.md`.

Girdi: $ARGUMENTS

Havuz bağlı değilse (`whoami` hata veriyorsa) kartı yine yaz, `mergen/bekleyen-kartlar.md` dosyasına kaydet ve bağlantı kurulunca gönderilebileceğini söyle.

## Kart yazmak

1. Kullanıcının anlatımını oku. Eksik ve kartı zayıflatacak bilgi varsa (hangi etkinlik, ne oldu, jüri ne dedi, sonuç ne oldu) en çok üç kısa soru sor.
2. Anlatımda birden çok ders varsa her biri ayrı kart olur.
3. Her ders için `pool_search` ile havuzda benzerini ara. Benzer varsa yeni kart yazma; kullanıcıya var olan kartı göster ve "bunun kanıtına eklenecek bir şey mi, yoksa farklı bir ders mi?" diye sor.
4. Kartları `tecrube-karti` biçiminde yaz ve kalite kontrol listesinden geçir. Bir neden genelleştirilebiliyorsa itiraz (`veto`) kartı olarak yaz ve test sorusunu kur.
5. Kartları kullanıcıya göster; düzeltmelerini al.
6. Onay gelince `card_submit` ile gönder. Kart numaralarını ver ve karantinada olduklarını söyle; havuza açılma kuralı `tecrube-karti` bölüm 6'da.

## Onay vermek (`onay`)

1. `quarantine_list` ile onay bekleyen kartları çek (kullanıcının kendi kartları gelmez).
2. Her kartı kısa göster ve kalite kontrol listesine göre görüşünü yaz: net mi, taşınabilir mi, kanıtı var mı, havuzda tekrarı var mı. İşaretli (şüpheli içerik) kartların metni ajanlara gösterilmez; bunları yalnız yönetici dashboard'dan inceleyip onaylayabilir.
3. Kullanıcı hangilerini onaylarsa `card_approve` ile onayla. Kullanıcı yönetici değilse onayı destek olarak kaydedilir; kart havuza yönetici onaylayınca girer. Uygun olmayan kartı yazarı ya da yönetici `card_shelve` ile gerekçe yazarak rafa kaldırabilir.
