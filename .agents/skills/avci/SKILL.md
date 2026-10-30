---
name: avci
description: "Tulpar'a katılmaya değer yaklaşan hackathonları buldurur, kulübün ilgi alanına göre sıralar ve kullanıcı onaylarsa havuzdaki hackathon listesine ekler. Kullanıcı \"yaklaşan hackathonlar\", \"hangi hackathona katılalım\", \"hackathon bul\", \"bu ay ne var\" dediğinde kendiliğinden kullan."
---

# Hackathon avı

Önce oku: `.agents/skills/surec/SKILL.md`.

İstek: kullanıcının mesajı

1. Havuz bağlıysa `hackathon_list` ile (`min_relevance: 0`, `limit: 20`; Tulpar'ın düşük puan verdikleri de gelsin) bilinen etkinlikleri ve `pool_search` ile kulübün hangi platform ve temalarda tecrübesi olduğunu çek (etiketlerden).
2. Tulpar'ı (`tulpar`, yaklaşan modu) çağır. Brifinge: kullanıcının isteği, kulübün ilgi alanları, bilinen etkinlikler (tekrar etmesin), çıktı yolu `mergen/avci/<tarih>.md`.
3. Tulpar'ın tablosunu oku; kritik bilgileri (tarih, kayıt son günü, ödül) en az iki etkinlik için kaynağından kendin doğrula. "(Chrome)" işaretli kaynağı tarayıcı aracıyla aç; "erişilemedi (Chrome bağlı değil)" satırı varsa kullanıcıya Codex'in tarayıcısını ya da Chrome eklentisini bağlamasını öner.
4. Kullanıcıya en çok 5 etkinlik öner; her biri için tek satır "neden" ve havuzda o platformla ilgili kaç ders olduğu. Kulüp bir blockchain kulübü: blockchain odaklı etkinlikler listenin başında durur, blockchain dışı olanlar ancak kulübe çok yarayacaksa ve onların altında. Kayıt son günü yakın olanı vurgula.
5. Kullanıcı seçerse `hackathon_add` ile havuza ekle (blockchain odaklıysa `blockchain: true`; listede en üste çıkar) ve o etkinlik için oturum açmayı (`hackathon` skill'i) öner.
