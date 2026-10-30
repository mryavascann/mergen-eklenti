---
name: simulasyon
description: "Mergen'in simülasyon modu. Sonuçları açıklanmış geçmiş bir hackathonu seçer, kazananları görmeden yalnız etkinlik öncesi bilgiyle (kurallar, jüri, önceki etkinlikler) normal bir hackathon oturumu yürütür, bir fikir bulur, jüri personalarına sunar, kendi fikrinin derecesini ve gerçek projelerin sıralamasını kör tahmin eder; sonra gerçek sonuçları açar, kıyaslar ve dersleri havuza yazar. Kullanıcı \"simülasyon yap\", \"simülasyon modunu başlat\", \"Mergen kendini eğitsin\", \"geçmiş hackathonlarla test et\", \"arka planda çalışsın\" dediğinde kendiliğinden kullan."
---

# Simülasyon modu

Önce oku: `.agents/skills/surec/SKILL.md`, `.agents/skills/puanlama/SKILL.md`, `.agents/skills/juri/SKILL.md`, `.agents/skills/fikir/tercihler.md`, `.agents/skills/fikir/kartlar.md`, `.agents/skills/tecrube-karti/SKILL.md`.

Girdi: kullanıcının mesajı

## Neden var

Mergen'in jüri simülasyonu ve puanları ancak gerçek sonuçlarla kıyaslanarak güvenilir hale gelir. Her simülasyon, kulübe bir veri satırı kazandırır: "Mergen bu hackathonda neyi tahmin etti, gerçekte ne oldu." Bu satırlar `sim_stats` karnesini, havuzdaki dersleri ve itirazları besler. Model ağırlığı eğitilmez; sistem, biriken veriden ve onaylanan kartlardan öğrenir.

Simülasyon gerçek bir oturum kadar abonelik kullanımı harcar. Kullanıcıya ilk çalıştırmada bunu bir cümleyle söyle.

## Körlük kuralları (en önemli kısım)

Simülasyonun değeri körlüğe bağlıdır. Kazananları bilen bir tahmin veri değil, gürültüdür.

- **Gözü açık tek ajan Ülgen'dir** (`ulgen`). Etkinliğin sonuç, kazanan, ödül ve "winner" rozetli galeri sayfalarını yalnız o açar (WebFetch'le ya da üyenin Chrome'unda; açtığı sekmeleri kapatır). Mergen ve diğer bütün ajanlar kör çalışır.
- **Araştırma serbesttir.** Simülasyon gerçek hackathonun provasıdır. Araştırma ajanları (Bilge, Kam, Bitigçi, Börü, Yankı) gerçek oturumdaki gibi arar, okur, yeniden arar; araçları ve yöntemi kısıtlanmaz, yalnız bu etkinliğin sonuçlarını aramazlar. Sızıntıya karşı koruma kısıt değil, çıkış denetimidir.
- **Çıkış denetimi.** Araştırma çıktısı karar ajanlarına (sen, Kayra, Töre, Kurultay, Yabancı) denetimden geçmeden ulaşmaz. `hackathon` ve `fikir` skill'lerindeki `pano/<ad>.md` yolları kör modda araştırma ajanına `mergen/simulasyon/_arastirma-<kisa-ad>/<ad>.md` olarak verilir; dosya adı aynı kalır (Kam'ın `personalar.md`'si dahil). Ajan bitince Ülgen'i denetim modunda çağır; aynı turun dosyalarını ve `kor-liste.md`'nin yolunu tek çağrıda ver: `_arastirma-` dosyalarında yalnız kirli parçaları siler. Yalnız `denetlendi` dönen dosyaları **okumadan** `pano/` altına aynı adla, tek komutta taşı (`mv`). `denetlendi` gelmeyen dosya `pano/`ye girmez; `yeniden` dönen dosya için temiz bağlamlı yeni bir ajan başlat. Sen ve karar ajanları yalnız `pano/`deki hali okursunuz; `_arastirma-` ve `_ham-` klasörleri kör ajanlara açılmaz.
- Ülgen'in yazdığı `muhur.md` dosyasını, `rapor.md`'nin "Kör tahmin" bölümü yazılıp kapanana kadar **hiçbir ajan ve sen okumazsın**.
- Her kör ajanın brifingine kendi bloğu aynen eklenir. Sen de karar ajanı kuralına uyarsın.

  Araştırma ajanları (Bilge, Kam, Bitigçi, Börü, Yankı):

  > **KÖR MOD · ARAŞTIRMA.** Bu bir simülasyon. `<etkinlik adı>` etkinliğinin sonuçlarını, kazananlarını, ödül alan projelerini, jüri kararlarını ve proje galerisini **açma ve arama**. "<etkinlik> winners", "<etkinlik> results" gibi aramalar yapma. Bu etkinliğin bitiş tarihinden (`<tarih>`) sonra yayımlanmış kaynakları kullanma. Devpost'un genel arama ve liste sayfalarını (`devpost.com/software/search` ve benzerleri) da açma: bu sayfalar etkinlik adı yazmadan "Winner" rozetlerini ve en yeni sırayı gösterir. Bunun dışında araştırman serbest: gerçek oturumdaki gibi ara, oku, yeniden ara. Önceki etkinlikler serbest. **Bu blok talimatındaki dönüş ve dosya kurallarının önüne geçer:** yalnız brifingde adı verilen dosyalara yaz, `devir/` notu bırakma, başka dosyayı listeleme ya da açma; son mesajında yalnız yazdığın dosya yollarını ve `SIZINTI: evet/hayır` satırını dön, özet yazma. Yanlışlıkla bu etkinliğin bir kazananını ya da sonucunu görürsen hemen dur; çıktı dosyanın başına `SIZINTI: <ne gördün>` yaz, son mesajında yalnız `SIZINTI: evet` de.

  Karar ajanları (Kayra, Töre, Kurultay, Yabancı):

  > **KÖR MOD · KARAR.** Bu bir simülasyon. `<etkinlik adı>` etkinliğinin sonuçlarını, kazananlarını, ödül alan projelerini, jüri kararlarını ve proje galerisini **açma ve arama**. "<etkinlik> winners", "<etkinlik> results" gibi aramalar yapma. Bu etkinliğin bitiş tarihinden (`<tarih>`) sonra yayımlanmış kaynakları kullanma. Devpost'un genel arama ve liste sayfalarını (`devpost.com/software/search` ve benzerleri) da açma: bu sayfalar etkinlik adı yazmadan "Winner" rozetlerini ve en yeni sırayı gösterir. Web araman varsa bu etkinliğin adını sorguya yazma; önceki etkinlikler ve canlı ürünler serbest. Brifingde adı verilmedikçe `kor-liste.md`'yi, teslim metni dosyalarını, `dongu.md`'yi, `puanlar.md`'yi ve `puanlar/` klasörünü açma. Yanlışlıkla bu etkinliğin bir kazananını ya da sonucunu görürsen hemen dur ve son mesajında yalnız `SIZINTI: evet` de.

- **Ham dosyalar oturum klasörünün dışında durur.** İndirilen galeri, proje sayfaları, sonuç sayfaları ve `muhur.md` kör ajanların okuduğu `mergen/simulasyon/<kisa-ad>-<tarih>/` içine girmez; `mergen/simulasyon/_ham-<kisa-ad>/` altına yazılır (Ülgen'in kör listeyi yazdığı kaynak da orada). Ülgen'den gelen sonuç yapısı bilgisi (finalist sayısı, track sayısı gibi) kör ajanların okuduğu `durum.md`'ye yazılmaz; `_ham-<kisa-ad>/yapi.md` dosyasında durur.
- Kör ajan brifinglerine şu satır standart olarak girer: "Oturum klasörünü Glob ile listeleme; yalnız adı verilen dosyaları aç." Dosya adları da (proje slug'ları) bilgidir.
- Araştırma ajanı `SIZINTI: evet` derse dosyası yine denetime gider ve işe temiz bağlamlı yeni bir ajan devam eder: denetimden geçmiş hali ona verilir, eksik kısmı `<ad>-2.md`'ye yazar ve o da denetlenir. Koşu kirlenmiş sayılmaz, çünkü sonuç bilgisi karar ajanlarına ulaşmadı. `durum.md`'ye yalnız sayıyı yaz; `sim_complete`'in `model_notes` alanının ilk satırı her koşuda `izole sızıntı: N` olur (0 dahil). Denetim yalnız adları değil, sızıntıyı anlatan paragrafın tamamını (eşlemeler dahil: "ödüllü projeler #11 ve #13 ile çakışıyor" gibi) siler. Syndicate by Maximor'da çakışma eşlemesi dosyada kaldı ve Töre turları onu okudu.
- **Kirli koşu:** sonuç bilgisi bir karar ajanına ulaştıysa (sen, Kayra, Töre, Kurultay ya da Yabancı gördüyse, denetimden geçmiş dosyada çıktıysa) ya da kendi belleğinden bu etkinliğin kazananlarını hatırladığını fark edersen `sim_mark` ile `contaminated` işaretle, notunu yaz ve simülasyonu tamamla: sonuçları yine `sim_complete` ile kaydet. Kirli koşular karneye girmez ama verisi kaybolmaz.
- Model belleği riski: modelin bilgi kesim tarihinden sonra biten etkinlikler tercih edilir. Daha eski bir etkinlik seçilirse raporda "bellek riski" diye işaretle.

## Döngü

Her simülasyon `mergen/simulasyon/<kisa-ad>-<tarih>/` klasöründe yaşar: `durum.md`, `pano/`, `puanlar/`, `kor-liste.md`, `rapor.md`. Ham veri ve `muhur.md` (yalnız Ülgen) kardeş klasörde: `mergen/simulasyon/_ham-<kisa-ad>/`.

### 1. Hackathon seçimi

- Girdi bir link içeriyorsa onu kullan. Yoksa `sim_list` ile kulübün simülasyonlarını çek (başka üyelerin şu an süren koşuları dahil: `blind` ya da sonuçları yazılmamış kirli koşular) ve Tulpar'ı (`tulpar`, geçmiş modu) çağır: 3 aday istesin. Brifinge bu listeyi ve kulübün ilgi alanlarını (havuzdaki platform etiketleri) ver. Kulübün birden çok üyesi simülasyon çalıştırır; aynı etkinliği iki kişinin aynı anda çalışmaması gerekir.
- Adaylardan birini seç: kurallar ve ölçütler açık, jüri listesi açık, proje listesi açık, sonuçlar açıklanmış, bilgi kesim tarihinden sonra bitmiş. Çeşitliliği gözet (farklı platform ve etkinlik türleri).
- **Ölçü kapısı.** `sim_start`tan önce Ülgen'i ön doğrulama modunda çağır: genel kolda (genel kol yoksa en büyük kolda) sıralı 1-2-3 yayımlanmış mı, galerideki teslimler erişilebilir mi. Ülgen ayrıntıyı `_ham-<kisa-ad>/yapi.md`'ye yazar, sana yalnız `geçti` ya da `geçmedi` döner; `durum.md`'ye yalnız `ölçü kapısı: geçti` yaz. `geçmedi` ise sıradaki adaya geç, aday kalmadıysa kullanıcıya söyle. Doğrulanmayan aday seçilmez: `top3_hits` bu olmadan tanımsızdır, koşu da karneye yazılamaz. AI Agent Hackathon'da (koşu 4d637f25) yalnız tek kazanan ve sponsor ödülleri vardı, Tulpar uyarmıştı, koşu başlatıldı ve kayda geçemedi.
- `sim_start` ile koşuyu aç (`engine: codex` ver); dönen numarayı `durum.md`'ye yaz. Sunucu, etkinliği şu an başka bir üye simüle ediyorsa koşuyu açmaz: sıradaki adayla dene. Aynı etkinlik daha önce tamamlanmışsa kullanıcı açıkça istemedikçe başka bir aday seç.

### 2. Mühür

Ülgen'i hazırlık modunda çağır. Ülgen:

- Etkinliğin sunulan projelerini ödül, rozet, derece ve sıralama bilgisi olmadan, karıştırılmış sırayla `kor-liste.md`'ye yazar (ad, tek satır açıklama, platform ve teknoloji etiketleri, olgunluk). Olgunluk sütunu canlı demo, video, açık repo ve ekran görüntüsü için var/yok yazar; yalnız projenin kendi tesliminden gelir, sonuç bilgisi taşımaz.
- Gerçek sonuçları (kazananlar, dereceler, varsa jüri yorumları ve sorulan sorular) `muhur.md`'ye yazar.
- Kör listedeki olgunluk, ölçüm ve zorunlu araç sütunları yalnız **tam teslim metninden** üretilir, kesik özetten değil (Syndicate by Maximor'da 73 projede ölçüm sütunu kesik metne göre "yok*" çıktı). Zorunlu araç sütunu üç eksende yazılır: kullanım yeri (yalnız inşa / ürünün çalışma düzlemi), orkestratörün kendi kararı var mı, saha notu var mı; sayı gibi kanıt eksikse "kısmen" yerine hangi eksenin boş kaldığı yazılır.
- Sana yalnız proje sayısını, kör listeye yazılan proje sayısını, olgunluk sütununda kaç projenin `bilinmiyor` kaldığını, sonuç kaynağının türünü ve "mühür hazır" bilgisini döner; kazanan adı söylemez.
- **Devpost:** etkinlik, galeri ve proje sayfaları WebFetch'e 403 verir; `curl` (tarayıcı User-Agent'ıyla) ve Chrome okur. Ülgen sayfayı açamazsa Mergen kullanıcıdan izin alıp sayfaları `_ham-<kisa-ad>/` altına `curl` ile indirir ve her proje sayfasından "Submitted to" (ödül/sonuç) bölümünü atan bir çıkarıcıyla tek özet dosyası üretir; Ülgen kör listeyi bu özetten yazar ve karartmaları ham HTML'ye karşı denetler. Karartma sözcük listesi dar tutulur: yalnız ödül ve sonuç ifadeleri ("winner", "won the", "1st place", "finalist", "prize"); "won't", "placed", "bet on winners" gibi gündelik kullanımlar karartılmaz. Dört araç doğrulanmış durumda ve `.agents/skills/simulasyon/araclar/` altına girer (henüz yoksa ilk koşuyu yapan üye `mergen/simulasyon/_araclar/` altındaki kopyaları buraya commit'ler): `devpost_indir.py` (curl ile indirir, urllib 403 alır; galeri sırasını karıştırır), `devpost_kor_ozet.py` (kör özet: #submissions, #updates, gönderim geçmişi, beğeni ve takım adlarını atar; dar karartma listesi), `devpost_bolum.py` ve `olcum_cumleleri.py` (tam metinden ölçüm cümlesi çıkarır). Araçlar varsa her koşuda yeniden yazılmaz, kullanılır. Kalibrasyon projeleri Devpost'taysa Töre için de aynı yol kullanılır.
- Galeri ya da sonuç sayfası açık uç ve WebFetch'le okunmazsa (DoraHacks, Devpost, Luma gibi JavaScript ağırlıklı ya da giriş isteyen sayfalar) Ülgen üyenin Chrome'unda okur. Ülgen galeri ya da sonuç sayfası için "erişilemedi (Chrome bağlı değil)" ya da "erişilemedi (giriş gerekli)" dönerse kör liste ya da mühür eksiktir: tek koşuda kullanıcıdan Codex'in tarayıcısını ya da Chrome eklentisini bağlamasını ya da siteye giriş yapmasını iste, sonra Ülgen'i yeniden çağır; sürekli çalışmada `sim_mark` ile `abandoned` işaretle ve başka adaya geç.

### 3. Kör oturum

`hackathon` skill'indeki Adım 1–3'ü kör modda yürüt; şu farklarla:

- Kullanıcıya soru sorma ve durak verme. Takım bilgisi yerine varsayılan bir takım kullan (3 kişi, tam yığın geliştirme, platformu orta düzey bilen) ve `durum.md`'ye yaz.
- Skor kartı onayı yok: tanımları ve ağırlıkları sen önerir ve kullanırsın; dosyada "simülasyon: onaysız" yazar. Onay olmasa da Şema 1 `puanlama` bölüm 1'e uyar: her resmi ölçüt eşleme tablosunda bir boyuta bağlanır, hiçbiri düşmez.
- Kalibrasyon için bu etkinlikten değil, **önceki** etkinliklerden proje kullanılır.
- Her ajan brifingine kendi körlük bloğu eklenir. Araştırma ajanlarının pano yolları ve denetim "Çıkış denetimi"ndeki gibidir; bu fark `hackathon` skill'indeki yolların önüne geçer.
- `hackathon` skill'indeki "panoyu kendin oku, kaynağından kendin aç" adımını denetimden sonra, yalnız denetimden geçmiş dosyadaki adreslerle yap.

### 4. Kör fikir hunisi

`fikir` skill'ini kör modda yürüt; şu farklarla:

- İlk turda en az 10 fikir. Bu bir taban, hedef değil; üst sınır yok. Tarama yolları ve tema sınırı aynen geçerli.
- Yankı araştırma ajanıdır: benzer aramasında bu etkinliğin galerisi yasak (körlük bloğu), önceki etkinlikler ve canlı ürünler serbest. `pano/huni<N>-yanki-<grup>.md` yolları "Çıkış denetimi"ndeki gibi `_arastirma-` altına verilir; sen ve Töre yalnız denetimden geçmiş hali okursunuz.
- Kurultay ilk 4 fikir ve joker için çalışır (`fikir` bölüm 3, adım 7); joker varsa 5. fikirdir. Fren bu seçimde kimseyi elemez.
- Fikirleri Kayra yazar (Kayra'nın brifingine karar bloğunu ekle); Mergen denetler. Kullanıcı yerine Mergen seçer: Hackathon puanı, fren ve jüri kararlarına göre tek bir final fikir. Seçim gerekçesini yaz. Frenli bir fikri (joker dahil) seçersen freni neyin aştığını `puanlama` bölüm 6'ya göre yaz: tasarım değişikliği (önce → sonra) ya da jüri sonucu.
- **Fikir döngüsü.** Gerçek oturumda kullanıcı "bu" diyene kadar huni açık kalır (`fikir` bölüm 6). Simülasyonda bu kararı sen verirsin: seçtiğin fikir 5. bölümdeki final eşiğini geçemezse rafa kalkar ve yeni tur başlar. Tur ve fikir sayısına üst sınır yoktur. NextGen Innovation'da (koşu c1668d4b) 10 fikrin 10'u kalibrasyondaki birincinin altında kaldı, huni "zayıf set" diye not düştü ve yine finale gidildi; beklenti `derece yok` idi.
  - **Yeni tur:** Kayra'ya rafa kalkan fikirleri, tutmayan koşulu, Töre'nin en düşük iki boyutta yazdığı gerekçeyi ve kalibrasyondaki birincinin gösterdiğini ver; puan sayılarını verme. En az 5 yeni fikir ya da varyant yazsın (`fikir` bölüm 6), üst sınır yok. Rafa kalkan fikir geri gelmez ve eşiğe ikinci kez girmez. Varyantın yeni sayılması için kullanıcı, çekirdek döngü ve primitiften en az biri değişir (`puanlama` kural 6). Rafa kaldırma gerekçelerinden itiraz üretilmez; `fikir` bölüm 5 simülasyonda uygulanmaz.
  - **Aynı ölçek:** Yeni fikirler aynı sıradan geçer (itiraz, Yabancı, Yankı, Töre, Kurultay). Önceki turlardan rafta olmayan en iyi 3 fikir, son puanlarına göre, yeni turun Töre puanlamasına yeniden girer; final adayı ayrı turların puanlarına bakılarak değil, bu ortak puanlamadan seçilir. Kalibrasyon döngüde yenilenmez.
  - **Tıkanma:** İki tur üst üste demo günü puanı yükselmediyse aynı yönde varyant yazdırma; henüz denenmemiş bir kullanıcı ailesi ya da tarama yolu iste.
  - **Kör liste kapalı:** Gerçek oturumda rakiplerin teslimleri fikir aşamasında görünmez. Döngü boyunca `kor-liste.md`'yi sen, Kayra ve Töre açmazsınız; kıyas yalnız önceki etkinliklerin kalibrasyonuyladır. Yoksa fikir sınavın sorularına göre yazılmış olur.
  - **Değerlendiriciler döngüyü bilmez:** Töre, Kurultay ve Yabancı brifinginde eşik, tur numarası ve önceki puan yazmaz. Eşiği geçirmek için puan yuvarlamak, tavan kaldırmak ya da şema değiştirmek yok.
  - **Kayıt:** Her turun final dosyaları ayrı durur, üstüne yazılmaz: `pano/demo-gunu-t<N>.md`, `puanlar/final-t<N>-tur1.md` (2, 3), `pano/sunum-t<N>.md`. Tur numarasını, fikir sayısını, en iyi fikri, demo günü puanını, tutmayan koşulu ve bu yolları `dongu.md`'ye yaz; bu dosyayı yalnız sen ve kıyasta Ülgen okur. `durum.md` ve `fikirler.md` kör ajanlara açıktır, oraya puan ve tutmayan koşul yazma. `fikir` bölüm 3 adım 8'deki puanlar ve karttaki "İki puan", "Neden geride kaldı" satırları simülasyonda karta değil `puanlar.md`'ye yazılır; Töre'ye giden eski kartlarda bu satırlar bulunmaz. `durum.md`'ye yalnız ilerleme işaretini koy (`tur <N>, adım 5.2 tamam`; 6. ve 7. bölümde de); oturum kesilirse bu işaretten sürersin.
  - **Bitiş:** Döngü final eşiği geçilince biter. Kullanıcı "bu fikirle bitir" derse ya da kullanım sınırı uyarısı görürsen döngüyü kapatırsın: eldeki en iyi fikirle 5. bölümü eksiksiz tamamlar ve `eşik: geçilmedi` yazarsın. Koşu `sim_complete`e kadar yürür; kesilirse işaretten sürersin.

### 5. Sunum ve tahmin

1. Final fikir için Kayra'ya derin analiz modunda kısa analiz yazdır: demo akışı (sahne biçimine göre), 30 saniyelik pitch, README ilk ekranı ve `puanlama` bölüm 9'daki demo günü hali (3 kişilik takım, etkinlik süresi). Kapsam süreyi doldurur; paragraf kullanılacak araçları ve neden çalışacağını yazar. Sonraki bütün Töre çağrıları bu paragrafı kullanır.
2. **Kendi tahminimiz:** Töre'yi üç paralel turda çağır; final fikrin Hackathon puanı (orta değer ve aralık) ve tahmini derecesi (`ilk 3` / `ilk 10` / `derece yok`) ve tek cümle gerekçe. Puan ve derece fikrin demo günü haline verilir (`puanlama` bölüm 9). Etkinliğin alanı bu aşamada görülmez: derece, kalibrasyondaki ve önceki etkinliklerdeki kazananlarla kıyasla verilir; "alan görülmedi" tek başına `derece yok` nedeni değildir.
3. **Sunum:** Kurultay'ın üç personasına pitch'i ve demo akışını ver (tek fikir modu); soruları ve kararları `pano/sunum.md`'ye yaz. Döngü sürerken madde 4'ün ilk iki koşulu tutmadıysa sunumu atla, boşa kullanım harcama; Bitiş yolunda sunum atlanmaz. `pano/sunum.md` kapanıştaki final fikrin sunumudur; Bitiş'te o fikrin sunumu yoksa çalıştırılır.
4. **Final eşiği.** Final fikir şu üç koşulu birden sağlamadan kör sıralamaya geçilmez; tek istisna 4. bölümdeki Bitiş'tir:
   - Üç Töre turunun en az ikisi `ilk 3` der.
   - Hackathon puanının orta değeri kalibrasyondaki birincinin orta değerine eşit ya da üstündedir.
   - Personaların çoğu `geçer` der (üçte en az iki).

   Karne freni eşiğin parçası değildir, `puanlama` bölüm 6'daki gibi kalır: NextGen Innovation'da 10 fikrin 10'u ve kalibrasyondaki birinci de frenliydi. Tutmazsa (Bitiş hariç) 4. bölümdeki fikir döngüsüne dön.
5. **Gerçek projelerin kör sıralaması:** Final eşiği geçildikten ya da Bitiş'e girildikten sonra, koşuda bir kez yapılır. Töre'yi `kor-liste.md` ile çağır: onaylı Şema 1'e göre en güçlü 10 projeyi sıralasın ve ilk 3'ü gerekçeleriyle seçsin. Projeler `puanlama` bölüm 9'a göre yaptıkları ve gösterdikleriyle okunur. Olgunluk sütunu sıralamanın girdisidir: canlı demo ve video, Şema 1'de demoya, uygulamaya ve görsel etkiye bakan ölçütler için kanıttır. Canlı demosu da videosu da olmayan bir projeyi ilk 10'a alıyorsa nedenini yazsın. Proje sayısı çoksa önce kısa açıklamalardan ve olgunluk sütunundan **40'a** indirsin (eşik 25'ten çıktı: kör ilk 25'te ödüllü katman %72 çıktı ama kürsü ayrılamadı, gerçek birinci 26. kaldı), sonra sıralasın. Yalnız **zorunlu teslim öğesinin eksikliği** (örneğin zorunlu video) kesin eleme nedenidir (Syndicate by Maximor'da bu projelerin 23'ünde 0 ödül çıktı). "Ölçümsüz" ve "araç kanıtı yok" eleme değil puan nedenidir (32 projede 13 ödüllü, iki kürsü). Canlı demo adresinin yokluğu teslim şartı değilse ne eleme ne sıra nedenidir; puan etkisi `puanlama` bölüm 9'daki S4 sınırını geçmez. Görülmüşlük, kalabalık kalıp ya da ayrışma tavanı uyguluyorsa sıralamayı bir de tavansız yapsın ve ilk 10'u iki sıranın birleşiminden seçsin (`puanlama` bölüm 4, kural 6). Final fikrimizin bu sıralamada nereye gireceğini de söylesin: demo günü haliyle (madde 1); bir projenin üstüne koyuyorsa fikrimizin göstereceği somut kanıtı o projenin olgunluk satırının karşısına yazsın.
6. Bütün tahminleri ve fikir döngüsünün turlarını (`dongu.md`) `rapor.md`'nin "Kör tahmin" bölümüne yaz. Bölümü kapatmadan Ülgen'e son taramayı yaptır; `kirli` dönerse koşuyu `contaminated` işaretle. **Bu bölüm yazılmadan mühür açılmaz.**

### 6. Mührü aç ve kıyasla

Kör tahmin bölümü kapandıktan sonra körlük biter.

1. `muhur.md`'yi oku. Töre'yi karşılaştırma modunda, final fikrimiz ile gerçek birinci arasında **iki sırayla** (iki ayrı çağrı) çağır; `puanlama` bölüm 9 geçerlidir. Brifinge Şema 1'i, fikrimizin demo günü halini (5. bölüm, madde 1) ve gerçek birinciyi fikir olarak değil, yaptığı ve gösterdiğiyle ver: kör listedeki satırı ve olgunluğu, teslim sayfasındaki demo, video, repo ve ekran görüntüleri. Töre'ye verilen kazanan teslim dosyalarından "Submitted to" (ödül ve sonuç) bölümünü çıkar ve çıkarmayı `winner|submitted to|prize` taramasıyla doğrula; temiz çıkmadan çağırma (Syndicate by Maximor'da iki karşılaştırma turu sonucu gördü).
2. Ülgen'i kıyas modunda çağır. Brifinge `rapor.md`'nin kör tahmin bölümünü, `kor-liste.md`'yi, `pano/sunum.md`'yi, `dongu.md`'yi, `muhur.md`'nin yolunu ve Töre'nin karşılaştırma sonuçlarını ver. Ülgen şunları hesaplar ve yazar:
   - `top3_hits`: kör ilk 3'ümüzden kaçı gerçek ilk 3'te.
   - `winner_rank_in_blind`: gerçek birincinin kör sıralamamızdaki yeri (ilk 10'da değilse boş).
   - Gerçek jüri soruları biliniyorsa personalarımızın bu soruları ne oranda tahmin ettiği (`persona_question_overlap`, 0–1).
   - Final fikrimiz demo günü haliyle (`puanlama` bölüm 9) gerçek kazananlarla kıyaslanınca nereye girerdi (`our_idea_would_place`), gerekçesiyle. `our_idea_would_place` Töre'nin "fikrimiz × gerçek birinci" kararından türetilmez: gerçek birinci kör sıralamada ilk 10 dışındaysa karşılaştırma "ölçeğin kaçırdığı proje" diye işaretlenir ve fikrin yeri, kazananların teslimde ve finalde gerçekten gösterdiğiyle (tamlık, kullanıcı, canlı adres, test) kalem kalem kıyaslanarak verilir. İki simülasyonda Töre fikrimizi, kör sırada 23.–48. olan gerçek birincinin üstüne koydu.
   - **Döngünün sınavı:** birden çok tur döndüyse ilk turun final adayı da (`pano/demo-gunu-t1.md`) aynı ölçüyle yerleştirilir: nereye girerdi, son fikir ondan iyi mi. Son fikir daha iyi değilse döngü puanı şişirmiş demektir; ders olarak yaz.
   - **Dersler:** kazananlarda olup bizim fikrimizde olmayan; doğru çıkan ve yanıltan itirazlar ve dersler; Töre'nin sistematik iyimser ya da kötümser olduğu boyutlar. Her dersin yanında onu yakalaması gereken ajan yazar.
   - **Ajan karnesi** (`surec` §9): bu koşuda çalışan her ajan için tek satır; neyi doğru, neyi yanlış yaptı, kanıtıyla.

### 7. Kaydet

1. Ülgen'in derslerinden `tecrube-karti` biçiminde kart taslakları çıkar: kazanan tariflerinden `recipe`, jüri yorumlarından `judge_note`, yanılgılardan `lesson` ya da `veto`. Dersin sahibi olan ajanı `codex-ajan:<ad>` etiketiyle yaz. Her biri için `pool_search` ile tekrar kontrolü yap.
2. `sim_complete`: bütün tahminler, gerçek sonuçlar, ölçüler, dersler ve kart taslakları (karantinaya `agent_draft` olarak girer; kullanıcı ya da diğer üyeler onaylar). `model_notes`'un ikinci satırı `fikir döngüsü: <tur> tur, <fikir> fikir, eşik: geçti|geçilmedi` olur.
3. `card_mark_used`: bu koşuda kullanılan havuz kartları, bağlam "simülasyon".
4. `rapor.md`'yi tamamla ve kullanıcıya kısa özet ver: etkinlik, fikrimiz, tahmin → gerçek, top3_hits, en önemli iki ders, kaç kart karantinaya girdi, güncel `sim_stats`.

## Sürekli çalışma

Kullanıcı sürekli çalışmasını isterse ("sürekli", "arka planda", "durdurana kadar"):

- Ortamda `loop` skill'i varsa onunla bu skill'i tekrar tekrar çalıştır (aralığı kendin ayarla; her döngü bir simülasyon). Yoksa bir simülasyon bitince bir sonrakine geç.
- Her döngüden önce önceki koşunun kaydedildiğini (`sim_list`) kontrol et.
- Kullanıcı durdurana kadar ya da kullanım sınırı uyarısı gelene kadar sürer. Sınır uyarısında son koşuyu kaydet ve dur.
- Her 5 koşuda bir `sim_stats` ile kısa bir ara rapor ver: isabet yükseliyor mu, hangi boyutta sistematik hata var.
- Aynı aralıkla bir **ajan eğitimi turu** yap (`surec` §9.4). Son koşuların ajan karnelerini ve `codex-ajan:` etiketli kartları gözden geçir. Aynı ajanda tekrarlanan her ders için `dev_note_add` ile `[Codex]` önekli talimat güncellemesi öner (hedef `codex/.codex/agents/<ad>.toml`). Ara rapora hangi ajana ne önerdiğini yaz.
