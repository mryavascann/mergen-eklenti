---
name: simulasyon
description: Mergen'in simülasyon modu. Sonuçları açıklanmış geçmiş bir hackathonu seçer, kazananları görmeden yalnız etkinlik öncesi bilgiyle (kurallar, jüri, önceki etkinlikler) normal bir hackathon oturumu yürütür, bir fikir bulur, jüri personalarına sunar, kendi fikrinin derecesini ve gerçek projelerin sıralamasını kör tahmin eder; sonra gerçek sonuçları açar, kıyaslar ve dersleri havuza yazar. Kullanıcı "simülasyon yap", "simülasyon modunu başlat", "Mergen kendini eğitsin", "geçmiş hackathonlarla test et", "arka planda çalışsın" dediğinde kendiliğinden kullan.
argument-hint: "[hackathon linki, isteğe bağlı] [sürekli]"
---

# Simülasyon modu

Önce oku: `${CLAUDE_PLUGIN_ROOT}/skills/surec/SKILL.md`, `${CLAUDE_PLUGIN_ROOT}/skills/puanlama/SKILL.md`, `${CLAUDE_PLUGIN_ROOT}/skills/juri/SKILL.md`, `${CLAUDE_PLUGIN_ROOT}/skills/fikir/tercihler.md`, `${CLAUDE_PLUGIN_ROOT}/skills/fikir/kartlar.md`, `${CLAUDE_PLUGIN_ROOT}/skills/tecrube-karti/SKILL.md`.

Girdi: $ARGUMENTS

## Neden var

Mergen'in jüri simülasyonu ve puanları ancak gerçek sonuçlarla kıyaslanarak güvenilir hale gelir. Her simülasyon, kulübe bir veri satırı kazandırır: "Mergen bu hackathonda neyi tahmin etti, gerçekte ne oldu." Bu satırlar `sim_stats` karnesini, havuzdaki dersleri ve itirazları besler. Model ağırlığı eğitilmez; sistem, biriken veriden ve onaylanan kartlardan öğrenir.

Simülasyon gerçek bir oturum kadar abonelik kullanımı harcar. Kullanıcıya ilk çalıştırmada bunu bir cümleyle söyle.

## Körlük kuralları (en önemli kısım)

Simülasyonun değeri körlüğe bağlıdır. Kazananları bilen bir tahmin veri değil, gürültüdür.

- **Gözü açık tek ajan Ülgen'dir** (`mergen:ulgen`). Etkinliğin sonuç, kazanan, ödül ve "winner" rozetli galeri sayfalarını yalnız o açar (WebFetch'le ya da üyenin Chrome'unda; açtığı sekmeleri kapatır). Mergen ve diğer bütün ajanlar kör çalışır.
- Ülgen'in yazdığı `muhur.md` dosyasını, `rapor.md`'nin "Kör tahmin" bölümü yazılıp kapanana kadar **hiçbir ajan ve sen okumazsın**.
- Kör ajanların brifingine şu blok aynen eklenir:

  > **KÖR MOD.** Bu bir simülasyon. `<etkinlik adı>` etkinliğinin sonuçlarını, kazananlarını, ödül alan projelerini, jüri kararlarını ve proje galerisini **açma ve arama**. "<etkinlik> winners", "<etkinlik> results" gibi aramalar yapma. Bu etkinliğin bitiş tarihinden (`<tarih>`) sonra yayımlanmış kaynakları kullanma. Önceki etkinlikler serbest. Yanlışlıkla bu etkinliğin bir kazananını ya da sonucunu görürsen hemen dur ve raporunun ilk satırına `SIZINTI: <ne gördün>` yaz.

- Bir ajan `SIZINTI` bildirirse ya da sen kendi belleğinden bu etkinliğin kazananlarını hatırladığını fark edersen, simülasyonu tamamla ama `sim_mark` ile `contaminated` işaretle ve notunu yaz. Kirli koşular karneye girmez.
- Model belleği riski: modelin bilgi kesim tarihinden sonra biten etkinlikler tercih edilir. Daha eski bir etkinlik seçilirse raporda "bellek riski" diye işaretle.

## Döngü

Her simülasyon `mergen/simulasyon/<kisa-ad>-<tarih>/` klasöründe yaşar: `durum.md`, `pano/`, `puanlar/`, `kor-liste.md`, `muhur.md` (yalnız Ülgen), `rapor.md`.

### 1. Hackathon seçimi

- Girdi bir link içeriyorsa onu kullan. Yoksa `sim_list` ile kulübün simülasyonlarını çek (başka üyelerin şu an süren `blind` koşuları dahil) ve Tulpar'ı (`mergen:tulpar`, geçmiş modu) çağır: 3 aday istesin. Brifinge bu listeyi ve kulübün ilgi alanlarını (havuzdaki platform etiketleri) ver. Kulübün birden çok üyesi simülasyon çalıştırır; aynı etkinliği iki kişinin aynı anda çalışmaması gerekir.
- Adaylardan birini seç: kurallar ve ölçütler açık, jüri listesi açık, proje listesi açık, sonuçlar açıklanmış, bilgi kesim tarihinden sonra bitmiş. Çeşitliliği gözet (farklı platform ve etkinlik türleri).
- `sim_start` ile koşuyu aç; dönen numarayı `durum.md`'ye yaz. Sunucu, etkinliği şu an başka bir üye simüle ediyorsa koşuyu açmaz: sıradaki adayla dene. Aynı etkinlik daha önce tamamlanmışsa kullanıcı açıkça istemedikçe başka bir aday seç.

### 2. Mühür

Ülgen'i hazırlık modunda çağır. Ülgen:

- Etkinliğin sunulan projelerini ödül, rozet, derece ve sıralama bilgisi olmadan, karıştırılmış sırayla `kor-liste.md`'ye yazar (ad, tek satır açıklama, platform ve teknoloji etiketleri, olgunluk). Olgunluk sütunu canlı demo, video, açık repo ve ekran görüntüsü için var/yok yazar; yalnız projenin kendi tesliminden gelir, sonuç bilgisi taşımaz.
- Gerçek sonuçları (kazananlar, dereceler, varsa jüri yorumları ve sorulan sorular) `muhur.md`'ye yazar.
- Sana yalnız proje sayısını, kör listeye yazılan proje sayısını, olgunluk sütununda kaç projenin `bilinmiyor` kaldığını, sonuç kaynağının türünü ve "mühür hazır" bilgisini döner; kazanan adı söylemez.
- Galeri ya da sonuç sayfası açık uç ve WebFetch'le okunmazsa (DoraHacks, Devpost, Luma gibi JavaScript ağırlıklı ya da giriş isteyen sayfalar) Ülgen üyenin Chrome'unda okur. Ülgen galeri ya da sonuç sayfası için "erişilemedi (Chrome bağlı değil)" ya da "erişilemedi (giriş gerekli)" dönerse kör liste ya da mühür eksiktir: tek koşuda kullanıcıdan `/chrome` ile bağlamasını ya da siteye giriş yapmasını iste, sonra Ülgen'i yeniden çağır; sürekli çalışmada `sim_mark` ile `abandoned` işaretle ve başka adaya geç.

### 3. Kör oturum

`hackathon` skill'indeki Adım 1–3'ü kör modda yürüt; şu farklarla:

- Kullanıcıya soru sorma ve durak verme. Takım bilgisi yerine varsayılan bir takım kullan (3 kişi, tam yığın geliştirme, platformu orta düzey bilen) ve `durum.md`'ye yaz.
- Skor kartı onayı yok: tanımları ve ağırlıkları sen önerir ve kullanırsın; dosyada "simülasyon: onaysız" yazar. Onay olmasa da Şema 1 `puanlama` bölüm 1'e uyar: her resmi ölçüt eşleme tablosunda bir boyuta bağlanır, hiçbiri düşmez.
- Kalibrasyon için bu etkinlikten değil, **önceki** etkinliklerden proje kullanılır.
- Her ajan brifingine körlük bloğu eklenir.

### 4. Kör fikir hunisi

`fikir` skill'ini kör modda yürüt; şu farklarla:

- En az 10 fikir; tarama yolları ve tema sınırı aynen geçerli.
- Yankı'nın benzer aramasında bu etkinliğin galerisi yasak (körlük bloğu); önceki etkinlikler ve canlı ürünler serbest.
- Kurultay ilk 4 fikir ve joker için çalışır (`fikir` bölüm 3, adım 7); joker varsa 5. fikirdir. Fren bu seçimde kimseyi elemez.
- Fikirleri Kayra yazar (Kayra'nın brifingine körlük bloğunu ekle); Mergen denetler. Kullanıcı yerine Mergen seçer: Hackathon puanı, fren ve jüri kararlarına göre tek bir final fikir. Seçim gerekçesini yaz. Frenli bir fikri (joker dahil) seçersen freni neyin aştığını `puanlama` bölüm 6'ya göre yaz: tasarım değişikliği (önce → sonra) ya da jüri sonucu.

### 5. Sunum ve tahmin

1. Final fikir için Kayra'ya derin analiz modunda kısa analiz yazdır: demo akışı (sahne biçimine göre), 30 saniyelik pitch, README ilk ekranı ve `puanlama` bölüm 9'daki demo günü hali (3 kişilik takım, etkinlik süresi). Sonraki bütün Töre çağrıları bu paragrafı kullanır.
2. **Sunum:** Kurultay'ın üç personasına pitch'i ve demo akışını ver (tek fikir modu); soruları ve kararları `pano/sunum.md`'ye yaz.
3. **Kendi tahminimiz:** Töre'yi üç paralel turda çağır; final fikrin Hackathon puanı (orta değer ve aralık) ve tahmini derecesi (`ilk 3` / `ilk 10` / `derece yok`) ve tek cümle gerekçe. Puan ve derece fikrin demo günü haline verilir (`puanlama` bölüm 9).
4. **Gerçek projelerin kör sıralaması:** Töre'yi `kor-liste.md` ile çağır: onaylı Şema 1'e göre en güçlü 10 projeyi sıralasın ve ilk 3'ü gerekçeleriyle seçsin. Projeler `puanlama` bölüm 9'a göre yaptıkları ve gösterdikleriyle okunur. Olgunluk sütunu sıralamanın girdisidir: canlı demo ve video, Şema 1'de demoya, uygulamaya ve görsel etkiye bakan ölçütler için kanıttır. Canlı demosu da videosu da olmayan bir projeyi ilk 10'a alıyorsa nedenini yazsın. Proje sayısı çoksa önce kısa açıklamalardan ve olgunluk sütunundan 25'e indirsin, sonra sıralasın. Final fikrimizin bu sıralamada nereye gireceğini de söylesin: demo günü haliyle (madde 1); bir projenin üstüne koyuyorsa fikrimizin göstereceği somut kanıtı o projenin olgunluk satırının karşısına yazsın.
5. Bütün tahminleri `rapor.md`'nin "Kör tahmin" bölümüne yaz. **Bu bölüm yazılmadan mühür açılmaz.**

### 6. Mührü aç ve kıyasla

Kör tahmin bölümü kapandıktan sonra körlük biter.

1. `muhur.md`'yi oku. Töre'yi karşılaştırma modunda, final fikrimiz ile gerçek birinci arasında **iki sırayla** (iki ayrı çağrı) çağır; `puanlama` bölüm 9 geçerlidir. Brifinge Şema 1'i, fikrimizin demo günü halini (5. bölüm, madde 1) ve gerçek birinciyi fikir olarak değil, yaptığı ve gösterdiğiyle ver: kör listedeki satırı ve olgunluğu, teslim sayfasındaki demo, video, repo ve ekran görüntüleri.
2. Ülgen'i kıyas modunda çağır. Brifinge `rapor.md`'nin kör tahmin bölümünü, `kor-liste.md`'yi, `pano/sunum.md`'yi, `muhur.md`'nin yolunu ve Töre'nin karşılaştırma sonuçlarını ver. Ülgen şunları hesaplar ve yazar:
   - `top3_hits`: kör ilk 3'ümüzden kaçı gerçek ilk 3'te.
   - `winner_rank_in_blind`: gerçek birincinin kör sıralamamızdaki yeri (ilk 10'da değilse boş).
   - Gerçek jüri soruları biliniyorsa personalarımızın bu soruları ne oranda tahmin ettiği (`persona_question_overlap`, 0–1).
   - Final fikrimiz demo günü haliyle (`puanlama` bölüm 9) gerçek kazananlarla kıyaslanınca nereye girerdi (`our_idea_would_place`), gerekçesiyle.
   - **Dersler:** kazananlarda olup bizim fikrimizde olmayan; doğru çıkan ve yanıltan itirazlar ve dersler; Töre'nin sistematik iyimser ya da kötümser olduğu boyutlar. Her dersin yanında onu yakalaması gereken ajan yazar.
   - **Ajan karnesi** (`surec` §9): bu koşuda çalışan her ajan için tek satır; neyi doğru, neyi yanlış yaptı, kanıtıyla.

### 7. Kaydet

1. Ülgen'in derslerinden `tecrube-karti` biçiminde kart taslakları çıkar: kazanan tariflerinden `recipe`, jüri yorumlarından `judge_note`, yanılgılardan `lesson` ya da `veto`. Dersin sahibi olan ajanı `ajan:<ad>` etiketiyle yaz. Her biri için `pool_search` ile tekrar kontrolü yap.
2. `sim_complete`: bütün tahminler, gerçek sonuçlar, ölçüler, dersler ve kart taslakları (karantinaya `agent_draft` olarak girer; kullanıcı ya da diğer üyeler onaylar).
3. `card_mark_used`: bu koşuda kullanılan havuz kartları, bağlam "simülasyon".
4. `rapor.md`'yi tamamla ve kullanıcıya kısa özet ver: etkinlik, fikrimiz, tahmin → gerçek, top3_hits, en önemli iki ders, kaç kart karantinaya girdi, güncel `sim_stats`.

## Sürekli çalışma

Kullanıcı sürekli çalışmasını isterse ("sürekli", "arka planda", "durdurana kadar"):

- Ortamda `loop` skill'i varsa onunla bu skill'i tekrar tekrar çalıştır (aralığı kendin ayarla; her döngü bir simülasyon). Yoksa bir simülasyon bitince bir sonrakine geç.
- Her döngüden önce önceki koşunun kaydedildiğini (`sim_list`) kontrol et.
- Kullanıcı durdurana kadar ya da kullanım sınırı uyarısı gelene kadar sürer. Sınır uyarısında son koşuyu kaydet ve dur.
- Her 5 koşuda bir `sim_stats` ile kısa bir ara rapor ver: isabet yükseliyor mu, hangi boyutta sistematik hata var.
- Aynı aralıkla bir **ajan eğitimi turu** yap (`surec` §9.4). Son koşuların ajan karnelerini ve `ajan:` etiketli kartları gözden geçir. Aynı ajanda tekrarlanan her ders için `dev_note_add` ile talimat güncellemesi öner. Ara rapora hangi ajana ne önerdiğini yaz.
