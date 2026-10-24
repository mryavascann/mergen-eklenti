---
name: ise-al
description: Tamga'ya Mergen ekibine yeni bir ajan "işe aldırır". Kullanıcının ihtiyacını (örneğin sosyal medya, kulüp etkinlikleri, sponsor takibi) dinler, mevcut ajanlarla çakışıp çakışmadığına bakar, rol, model, araçlar ve sınırlarla bir ajan tanımı yazar; kullanıcı onaylayınca kaydeder. Kullanıcı "bir ajan lazım", "yeni ajan al", "şunun için ajan kur" dediğinde kendiliğinden kullan.
argument-hint: "<ihtiyaç>"
---

# /mergen:ise-al

İhtiyaç: $ARGUMENTS

1. **Tamga**'yı (`mergen:tamga`) çağır. Brifinge: kullanıcının ihtiyacı, Mergen'in mevcut ajan listesi (`${CLAUDE_PLUGIN_ROOT}/agents/` altındaki dosya adları ve açıklamaları), kullanıcının proje ve kişisel ajan klasörlerinde zaten olan ajanlar (`.claude/agents/`, `~/.claude/agents/`), taslağın yazılacağı yol `mergen/ise-alim/<ajan-adi>.md`.
2. Tamga ihtiyaç belirsizse sorularını döner; soruları kullanıcıya sor, cevaplarla Tamga'yı yeniden çağır.
3. Taslağı oku ve kullanıcıya özetle: ajanın adı ve görevi, modeli ve neden, araçları ve neden, yapamayacakları, mevcut bir ajanla çakışma varsa.
4. Kullanıcı onaylarsa nereye kaydedileceğini sor:
   - **Bu proje** → `.claude/agents/<ajan-adi>.md`
   - **Kişisel, her projede** → `~/.claude/agents/<ajan-adi>.md`
   Eklenti klasörüne (`${CLAUDE_PLUGIN_ROOT}`) yazma: eklenti güncellenince silinir. Ajan kulübün bütün üyelerine gerekiyorsa, kullanıcıya bunun eklentiye eklenmesi için repoya önerilmesi gerektiğini söyle.
5. Kaydettikten sonra yeni ajanın bir sonraki oturumda (ya da `/agents` ile yenilenince) kullanılabileceğini söyle.
