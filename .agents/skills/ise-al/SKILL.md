---
name: ise-al
description: "Tamga'ya Mergen ekibine yeni bir ajan \"işe aldırır\". Kullanıcının ihtiyacını (örneğin sosyal medya, kulüp etkinlikleri, sponsor takibi) dinler, mevcut ajanlarla çakışıp çakışmadığına bakar, rol, akıl yürütme düzeyi ve sınırlarla bir Codex ajan tanımı yazar; kullanıcı onaylarsa kaydeder."
---

# $ise-al

İhtiyaç: kullanıcının mesajı

1. **Tamga**'yı (`tamga`) çağır. Brifinge: kullanıcının ihtiyacı, Mergen'in mevcut ajan listesi (`.codex/agents` altındaki dosya adları ve açıklamaları), kullanıcının kişisel ajan klasöründe zaten olan ajanlar (`~/.codex/agents`) ve taslağın yazılacağı yol (`mergen/ise-alim/<ajan-adi>.toml`).
2. Tamga ihtiyaç belirsizse sorularını döner; soruları kullanıcıya sor, cevaplarla Tamga'yı yeniden çağır.
3. Taslağı oku ve kullanıcıya özetle: ajanın adı ve görevi, akıl yürütme düzeyi ve neden, yapamayacakları, mevcut bir ajanla çakışma varsa. Dosyada `name`, `description`, `model_reasoning_effort`, `developer_instructions` dışında bir ayar varsa kaydetme.
4. Ad yalnız küçük harf, rakam ve tire olabilir. Kullanıcı onaylarsa `~/.codex/agents/<ajan-adi>.toml` yoluna kaydet. Bu klasördeki `.codex/agents` kulübün deposundan gelir ve güncellenir; oraya yazma. Ajan kulübün bütün üyelerine gerekiyorsa `dev_note_add` ile `[Codex]` notu bırak.
5. Yeni ajanın bir sonraki oturumda kullanılabileceğini söyle.
