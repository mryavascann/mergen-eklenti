---
name: prompt
description: "Kalemşor'a bir isteği iyi bir prompta döktürür ya da var olan bir prompt'u iyileştirir. Kullanıcı bir fikri, düzenlemeyi ya da taslak prompt'u verir; Kalemşor teşhis, iyileştirilmiş prompt ve değişiklik gerekçesi döner. Kullanıcı \"şunu prompta dök\", \"bu prompt'u iyileştir\", \"prompt yaz\" dediğinde kendiliğinden kullan."
---

# $prompt

Girdi: kullanıcının mesajı

1. Girdi bir dosya yoluysa dosyayı oku; değilse metni istek olarak al.
2. Prompt'un kime ve ne için olduğu belli değilse (hangi model ya da ajan, hangi iş, çıktı nereye gidecek) en çok iki kısa soru sor.
3. **Kalemşor**'u (`kalemsor`) prompt modunda çağır. Brifinge: istek ya da taslak, hedef model/ajan, bağlam (varsa oturumdaki ilgili dosyalar), kullanıcının özellikle istediği değişiklikler, çıktı yolu (taslak bir dosyaysa yanına `-iyilestirilmis` ekli kopya; değilse `mergen/promptlar/<kisa-ad>.md`).
4. Kalemşor'un çıktısını oku; gerekçesi zayıf bir değişiklik varsa sorgula.
5. Kullanıcıya ver: kısa teşhis (en çok 5 madde), iyileştirilmiş prompt'un yolu, en önemli üç değişiklik ve nedeni. Orijinal dosyanın üzerine kullanıcı istemeden yazma.
