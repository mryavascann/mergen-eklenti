---
name: puanlama
description: "Mergen'in fikir puanlama yöntemi. İki ayrı şema (hackathon şeması ve kulüp karnesi şeması), puan tanımları, kalibrasyon, rakip ve görülmüşlük tavanları, aralıklı puan, fren, eşitlik, ikili karşılaştırma, yeniden puanlama ve fikrin yapılmış projelerle kıyası (demo günü ölçüsü). Töre ve Mergen puan verirken okur."
---

# Puanlama

Her fikir iki ayrı şemayla, 5 üzerinden puanlanır ve iki ayrı puan alır. İki puan hiçbir yerde tek sayıya çevrilmez.

| | Şema 1 · Hackathon şeması | Şema 2 · Kulüp karnesi şeması |
|---|---|---|
| Neyi ölçer | Karar verenlerin elindeki kâğıda göre nerede dururuz | Kulübün geçmişte zayıf kaldığı yerleri bu fikirde tekrarlıyor muyuz |
| Boyutlar | Etkinliğin kendi ölçütleri | Kulüp karnesinin 8 boyutu; adları sabit |
| Ağırlıklar | Etkinlik sayfasındaki ağırlıkların aynısı | Mergen önerir, kullanıcı onaylar |
| Sonuç | **Hackathon puanı** | **Karne puanı** |
| Görevi | Sıralamayı belirler | Fren görevi görür |

## 1. Şema 1 · Hackathon şeması

- Ölçütleri ve ağırlıkları etkinliğin resmi sayfasından **kelimesi kelimesine** al. Yanına linki ve bakıldığı tarihi yaz.
- Ağırlıkları değiştirmek, ölçütleri birleştirmek, kendi merceğini eklemek yok. Bu şema karar verenlerin kâğıdının aynısıdır.
- **Hiçbir resmi ölçüt düşmez.** Her resmi ölçüt şemada bir boyuttur. Sayfa birkaç ölçütü tek başlıkta veriyorsa (örnek: "Aesthetics / Wow factor") tek boyutta kalabilir; tanımında her biri payıyla ayrı yazılır. "Fikir aşamasında ölçülemez" görünen ölçüt de kalır; ona da fikir aşaması sorusu yazılır. Şemanın altına eşleme tablosu koy: `resmi ölçüt | şemadaki boyut | ağırlık`. Boyutu boş kalan ölçüt varsa şema bitmemiştir. İlk simülasyonda estetik ve "wow" ölçütleri şemadan düştü; kazananların hepsinde görsel bir yıldız anı vardı.
- **Görsel etki ve yıldız anı.** Resmi ölçütler tasarım, estetik, kullanıcı deneyimi ya da "wow" anıyorsa o ölçüt demonun yıldız anını puanlar: jürinin ekranda gördüğü, akılda kalan görsel dönüşüm (fotoğraftan tasarım, kısa videodan ürün, sosyal medya bağlantısından site gibi). Fikir aşaması sorusu: "demoda jüri ekranda neyin neye dönüştüğünü görür, akılda hangi görüntü kalır". Sayfa başka tanım vermiyorsa 5: tek bakışta anlaşılan, canlı bir görsel dönüşüm; 1: ekranda yalnız metin, terminal ya da log. Kısa karttaki "Tek sahne" ve "Demo anı" satırları bu ölçütün girdisidir.
- Ölçütler bitmiş proje için yazılmıştır; biz fikir puanlıyoruz. Her ölçüt için fikir aşamasında ne sorduğunu tek cümleyle yaz. Örnek: "demo ve sunum" → "bu fikrin demosu karar verenlere ne gösterir, akılda ne kalır".
- **Ölçülebilir kazanç ölçütü (S3) iki eksende okunur:** büyüklük (kazancın ne kadar olduğu) ve bütünlük (gizli anahtar ya da taban, ablasyon, geri çekilen sonuç, dürüst null). Projenin kendi yazdığı zayıf yan ceza değil, bütünlük kanıtıdır. Syndicate by Maximor'da en yüksek S3'ler kürsüye girmedi; kazananlar dürüst null ve recall düşüşünü yazmıştı.
- Sayfada alt açıklama yoksa her ölçüt için "5 puan" ve "1 puan" tanımını en yakın emsallerden çıkar (aynı organizatörün önceki ölçütleri, karar verenlerin sorduğu sorular, organizatörün yazdıkları) ve "çıkarım" diye işaretle.
- Rakip, görülmüşlük ve anlatılabilirlik tavanlarının (bölüm 4, kural 5, 6, 8) hangi ölçüte uygulanacağını belirt; hiçbirine uymuyorsa "uygulanmaz". Anlatılabilirlik tavanı için demo, sunum, kullanıcı deneyimi ya da etki ölçütlerinden en yakını seçilir.
- Ölçütler yayımlanmamışsa en yakın emsalin ölçütlerini kullan, "emsal" diye işaretle ve organizatöre sorulacak sorulara ekle. Ağırlık yoksa eşit say.
- Kazananı oylama belirliyorsa şema, oylama rehberindeki ölçütlerdir; rehber yoksa geçmiş oylama kazananlarından çıkar ("çıkarım"). Oylamanın mekaniğini ayrıca yaz; puana katma.
- İki aşamalı değerlendirmede her aşamanın ölçütlerini ayrı listele; sıralama ilk 3'ü belirleyen aşamaya göre yapılır. Track varsa şema, hedeflenen track'in ölçütleridir.
- Bonuslar Hackathon puanına katılmaz; ayrı sütunda 1–5. 5: bonus ürünün çalışmasının parçası ve kesin gösterilebilir. 1: üründen kopuk ya da yapılamıyor. Sayfa bonusun kaç puan getirdiğini yazıyorsa onu da belirt.
- Kurallar sonradan açıklanır ya da değişirse şema değişir ve fikirler yeniden puanlanır (`$revize`).

## 2. Şema 2 · Kulüp karnesi şeması

Sekiz boyutun adı her hackathonda aynıdır; eklemek, çıkarmak, yeniden adlandırmak yok. "Platform primitiflerinden yararlanma"da platform yerine bu hackathonun platformu okunur.

| Boyut | Fikir aşamasında sorduğu soru |
|---|---|
| Teknik uygulama kalitesi | Çekirdek, çalıştığı doğrulanmış araçlarla temiz, test edilebilir, hataya dayanıklı kurulabilir mi? Doğrulanmamış bir uca bağımlı mı? |
| Platform primitiflerinden yararlanma | Fikir platformu o platform yapan yetenekler olmadan çalışamıyor mu? Aynısı en güçlü rakipte yapılabiliyor mu? |
| Ürün-pazar uyumu kanıtı | Bunu isteyen biri olduğuna dair ne var? Etkinlik sırasında gerçek kullanım kanıtı toplanabilir mi? |
| Rakiplerden ayrışma | "Bunu X zaten yapıyor" ve "geçen etkinlikte görmüştük" itirazlarına net cevap var mı? |
| Regülasyona hazırlık | Fikir hangi düzenlemeye dokunuyor; tasarım buna göre mi kuruldu? |
| Ölçeklenebilirlik tasarımı | Demo ölçeğinden gerçek kullanıma geçince tasarım dayanır mı; darboğaz nerede? |
| Dokümantasyon ve kanıt kültürü | Fikir kendiliğinden doğrulanabilir kanıt üretiyor mu: kayıt, ölçüm, canlı adres? README ve tanıtım ürünü anlatmadan anlatıyor mu? |
| İş modeli | Para kimden, neden, nasıl gelir? Ürün nasıl yayılır? |

### Karne nereden gelir

Önce havuzdan `scorecard_get` ile kulüp karnesini çek: boyut başına ortalama, kayıt sayısı, son gerekçe ve en zayıf iki boyut. Bu, kulübün bitmiş projelerinin birikimli karnesidir; her `$sonuc` ile büyür.

Havuz bağlı değilse ya da karne boşsa kulübün ilk kaydını kullan (Stellar hackathonu, bitmiş bir ortak kasa projesi):

| Boyut | Puan | Gerekçe |
|---|---|---|
| Teknik uygulama kalitesi | 4,5 | Test/doğrulama disiplini, idempotentlik ve tutar hassasiyeti örnek düzeyde; tek parça arayüz dosyası ve RPC okuma maliyeti puan kırıyor. |
| Platform primitiflerinden yararlanma | 3,5 | Temel primitifler doğru kullanılmış; platformu "o platform yapan" silahlar sahada değil. |
| Ürün-pazar uyumu kanıtı | 1,5 | Sıfır gerçek kullanıcı. |
| Rakiplerden ayrışma | 2,5 | Ana mekanik rakiplerde var; ayrışma vaatte kaldı. |
| Regülasyona hazırlık | 1,5 | Yerel düzenleme mimariyi doğrudan etkiliyor; hiç ele alınmamış. |
| Ölçeklenebilirlik tasarımı | 2,5 | MVP için kabul edilebilir; ürün vizyonu için değil. |
| Dokümantasyon ve kanıt kültürü | 5 | Açık ara en güçlü yön. |
| İş modeli | 1 | Hiç yok. |

O projenin konusu ve platformu fikir girdisi değildir. Karneden yalnız üç şey alınır: boyutların adları, gerekçelerin tonu ve kulübün zayıf yönleri.

### Simülasyon karnesi

`sim_stats`, Mergen'in geçmiş hackathonlarda kör yaptığı tahminlerin gerçek sonuçlarla ne kadar tuttuğunu gösterir (`simulasyon` skill'i). Mergen, Töre'yi her çağırdığında bu karnenin kısa özetini brifinge koyar: kaç koşu var, kör ilk 3 isabeti, gerçek birincinin ortalama yeri, son derslerde geçen sistematik hatalar ("Töre teknik derinliği fazla puanlıyor" gibi). Töre bu uyarıları kalibrasyon notu olarak kullanır; puanlama kurallarının yerine koymaz. Koşu sayısı 5'ten azsa karne "henüz güvenilir değil" diye okunur.

### Tanımlar ve ağırlıklar

- Her boyut için bu hackathonun alan profiline göre "5 puan" ve "1 puan" tanımı yaz (örnek: "Ürün-pazar uyumu kanıtı" zincir üstü bir etkinlikte "salondaki gerçek cüzdanlardan işlem toplayabiliyor muyuz", ajan etkinliğinde "ajan gerçek hesapta insansız çalışıyor mu" diye okunur). Adım 3'ün durağında onaya sun.
- Ağırlıkları Mergen önerir: her boyuta bir yüzde ve tek cümle gerekçe. İki şeye bak: alan profili (hangi boyut burada belirleyici) ve karne (zayıf boyutlar bu kez gözden kaçmasın). Hiçbir boyut %5'in altına inmez, toplam %100. Onay gelmeden puanlamaya başlama. Kullanıcı "sen karar ver" derse eşit ağırlık.

## 3. Ölçek

- 1–5, yarım puan kullanılabilir.
- **Şema 1 göreli okunur:** 3 bu etkinlikte ortalama bir proje; 4 ilk çeyrek; 5 geçmiş kazananların o boyuttaki en iyisiyle aynı düzey; 2 belirgin zayıflık; 1 yok ya da karar verenlerin açıkça cezalandırdığı durum.
- **Şema 2 mutlak okunur:** onaylanan tanımlara ve karnedeki ölçüye göre. "Hiç yok" 1, "var ama kanıtsız ya da simülasyon" 2,5, "örnek düzeyde" 4,5. Başka projelerin de zayıf olması Şema 2'de puanı yükseltmez.
- Fikre gerçekten uygulanmayan bir Şema 2 boyutu 3 alır ve "uygulanmıyor" yazar.

## 4. Kurallar

Acımasız bir jüri gibi puanla. Geçmişte puanlar fazla iyimser çıktı; yeni bilgi gelince 4,60 alan fikir 3,80'e düştü.

1. **Önce tanım, sonra puan.** İki şemanın her boyutu için tanım yazılıp onaylanmadan fikirlere puan verilmez. Tek istisna kalibrasyondur: Adım 3'te, onaya sunulacak tanım ve ağırlıklar önerilen halleriyle kullanılır ("önerilen" diye işaretlenir); kullanıcı tanımları değiştirirse kalibrasyon yenilenir.
2. **Önce kalibrasyon.** Fikirlerden önce geçmiş etkinlikten üç proje iki şemayla puanlanır: birinci olan, en kalabalık kalıptan derece alamayan, sıradan bir proje. Bunlar ölçeğin çapasıdır; bir fikre birinciden yüksek puan veriliyorsa nedeni bölüm 9'a göre yazılır: fikrin demo gününde göstereceği somut kanıt.
3. **Önce benzer kontrolü.** Puandan önce benzeri üç yerde aranır ve fikir kartına yazılır: organizatörün geçmiş etkinlikleri, platformda bugün canlı olan ürünler, başka platformlardaki ürün ve hazır çözümler. "Arz var, kullanıcı yok" durumu da yazılır.
4. **4 ve üstü için dayanak.** Gerekçe somut bir kaynağa, ölçüme ya da geçmiş bir kazananla karşılaştırmaya dayanmıyorsa o boyut en çok 3,5 alır.
5. **Rakip testi.** Fikrin yaslandığı nokta en az bir rakipte de varsa şu boyutlar 3'ü geçemez: Şema 2'de "platform primitiflerinden yararlanma", Şema 1'de bu teste eşlenen ölçüt. "Hızlı" ya da "ucuz" gibi rakiplerin çoğunda olan özellik öne çıkan nokta sayılmaz; yalnız böyle bir özelliğe yaslanan fikir genel tercihlerdeki "platforma yaslanma" ŞART'ına takılır ve önerilmez.
6. **Görülmüşlük testi.** Ölçü üç şeydir: kullanıcı, çekirdek döngü, primitif. Görülmüş bir projeyle ikisi aynıysa şu boyutlar en çok 2 alır: Şema 2'de "rakiplerden ayrışma", Şema 1'de eşlenen ölçüt. Kalabalık bir kalıptaysa en çok 3. Üçü de aynıysa fikir kopyadır ve önerilmez.
   - **Tavanın kendi sınavı.** Görülmüşlük, kalabalık kalıp ya da ayrışma tavanı uygulanan her sıralamada (özellikle simülasyonun kör sıralaması) sıralamayı bir de tavansız hesapla; ilk 10'u iki sıranın birleşiminden seç ve hangi projenin yalnız birinde girdiğini yaz. Tavan körü körüne ödül elemesi olmasın: iki simülasyonda tavan yüzünden kürsü projeleri aşağı düştü (Request Network benzerliğiyle kör 25'te 23. kalan birinci).
   - **Kalabalık kalıp hükmü** bu etkinliğin karar vericilerinin alanından kurulur, başka etkinliklerin ödül oranından değil (`surec` §10).
   - **Tamamlanmış ödeme-aracı kalıpları** (fatura, emanet, tüccar aracı gibi): "en çok 2" tavanı yalnız kullanıcı, çekirdek döngü ve primitifin üçü de aynıysa uygulanır; ikisi aynıysa kalabalık kalıp tavanı (3) geçerli kalır.
   - **Tavan kaldırılmaz, dengelenir.** Tavanın doğru yönde çalıştığı kalıplar var (ajan-harcama koruması, 9 projeden 0 kürsü); bu yüzden ikinci sıralama tavanın yerini almaz, onu sınar.
7. **Süre puan kırmaz.** Kapsamı süreye kullanıcı sığdırır; "bu sürede yetişmez" diye puan kırılmaz. Yalnız çekirdek ile olsa iyi olur ayrılır. Doğrulanmamış bir uca ya da araca bağımlılık ise teknik risktir ve puan kırar. Yapılmış projelerle kıyas süre cümlesinin istisnasıdır (bölüm 9).
8. **Anlatılabilirlik.** Yabancı testinin (`fikir` skill'i, bölüm 3) sonucu üç türlüdür. **Tam:** tavan yok. **Kısmen:** Şema 1'de anlatılabilirlik tavanının eşlendiği ölçüt ve Şema 2'de "Dokümantasyon ve kanıt kültürü" en çok 3 alır. **Uyuşmuyor** (bir yeniden yazımdan sonra da): fikir genel tercihlerdeki anlatılabilirlik ŞART'ına takılır ve önerilmez; kıyas için yararlıysa kontrast olarak puanlanabilir. Kulüp bir hackathonu README ve tanıtım yüzünden ön elemede kaybetti.
9. **Gerekçe biçimi.** Her boyut için tek cümle: neyin iyi olduğu ve puanı neyin kırdığı aynı cümlede. Ton karnedeki gibi.
10. **Tablo biçimi.** `Boyut | Puan | Tek cümlelik gerekçe`; iki şema iki ayrı tablo. Toplam = Σ(ağırlık × puan), 5 üzerinden, iki ondalık. Altına en düşük iki boyutu nasıl yükselteceğimizi yaz.
11. **Belirsizliği çift değerle göster.** Puan tek bir bilinmeyene bağlıysa: `3,0 (test geçerse 4,0)`. Sıralama, fren ve eşitlik bugünkü değerle hesaplanır.

## 5. Aralıklı puan

Tek bir puanlama turu sahte kesinlik üretir. Bu yüzden:

- Töre aynı fikir setini **üç bağımsız turda** puanlar. Üç tur **aynı anda, paralel** başlatılır; her tur ayrı alt ajan çağrısıdır, aynı girdileri alır ve kendi çıktı dosyasına yazar: `puanlar/<etiket>-tur1.md`, `-tur2.md`, `-tur3.md` (etiket: `kalibrasyon`, `huni1`, `derin` gibi). Turlar birbirinin dosyasını okumaz.
- Mergen üç dosyayı birleştirir ve `puanlar.md`'ye yazar: her boyut ve toplam için **orta değer** (medyan) ve **aralık**: `3,6 (3,4–3,9)`.
- Sıralama, fren ve eşitlik orta değerle hesaplanır.
- Bir boyutta turlar arası fark 1,0 ya da üstüyse o boyut **"belirsiz"** işaretlenir. Mergen nedenini bulur: eksik bilgi mi, tanım mı muğlak, fikir kartı mı iki türlü okunuyor. Kartı ya da tanımı **bir kez** netleştirip yalnız belirsiz fikirleri yeniden üç turda puanlatır. Fark yine 1,0 ve üstüyse "belirsiz" işareti kalır ve kullanıcıya söylenir; üçüncü deneme yapılmaz.
- Kalibrasyon projeleri de aynı yöntemle puanlanır.

## 6. Sıralama, fren ve eşitlik

- **Sıralama:** Hackathon puanına göre.
- **Fren:** Karne puanı ayrı sütunda durur. Bir fikir şu durumlardan birindeyse **frenlidir**: Karne puanı 3,0'ın altında ya da ağırlığı %10 ve üstü olan bir karne boyutu 2,0 ya da altında.
- **Fren ceza değil, yapılacak iştir.** Frenli fikir elenmez. Derin analize ya da finale önerilebilmesi için zayıf boyutu yükselten somut bir tasarım değişikliği ve o değişiklikle yeniden puanlama (önce → sonra) gerekir. Yeni puan iki eşiği de aşıyorsa fren kalkar; aşmıyorsa fikir derin analize yalnız kullanıcı isterse girer.
- **Fren jüriden önce elemez.** Kurultay'a gidecek fikirler seçilirken fren kimseyi listeden çıkarmaz; frenli fikir bayrağıyla gider. Frene tek bir boyut yüzünden takılan fikirler için ayrıca bir joker yeri vardır (`fikir` bölüm 3, adım 7). İlk simülasyonda gerçek kazanana en yakın fikir tek boyutta frene takıldı ve jüriye hiç ulaşmadı.
- **Jüri sonucu freni aşabilir, yazılı gerekçeyle.** Fren derin analizde ve final seçiminde geçerli kalır. Tek istisna jüri sonucudur: Kurultay'ın kararları freni aşmayı haklı çıkarıyorsa fikir tasarım değişikliği olmadan da önerilebilir. Gerekçe hangi persona kararlarına dayandığını ve frenli boyutun karar verenler için neden belirleyici olmadığını söyler; `puanlar.md`'ye ve dosyaya yazılır. Gerekçe yazılmadan fren aşılmaz.
- **Freni puanla değil tasarımla aş.** Eşiği geçmek için puan yuvarlamak yok.
- **Eşitlik:** Sıralı listede üstten başla. Grubun ilk fikriyle Hackathon puanının orta değer farkı 0,10'u geçmeyenler ya da aralıkları örtüşüp orta değer farkı 0,25'i geçmeyenler aynı gruptadır; üç turun dağılımı küçük farkları anlamsız kılar. Grup içinde sıra: önce bonusları güçlü olan, sonra Karne puanı yüksek olan, sonra tercihlere daha çok uyan.
- **Eşik denetimi:** İlk puanlamada fikirlerin yarısından fazlası ya da hiçbiri frenli çıkarsa eşik işe yaramıyordur; söyle ve yeni eşik öner.

## 7. İkili karşılaştırma

Dil modelleri "A mı B mi" sorusunda mutlak puandan çok daha tutarlıdır. Derin analizin sonunda finalistler ikili karşılaştırılır:

- Her fikir çifti için Kurultay'ın üç jüri personası ve Töre ayrı ayrı "hangisi ilk 3'e daha yakın" diye karar verir; her karar Şema 1 ölçütlerine dayanan tek cümle gerekçe taşır.
- **Her çift iki sırayla sorulur** (A–B ve B–A, ayrı çağrılarla). Dil modelleri önce ya da sonra gösterilen seçeneği kayırabilir; iki sırada farklı karar veren değerlendirici o çift için "berabere" sayılır.
- Galibiyet sayısı tablosu çıkar. İkili sıralama puan sıralamasıyla çelişiyorsa bunu yaz ve nedenini araştır; kararı kullanıcı verir.

## 8. Yeniden puanlama

- Puanlar üç durumda değişir: yeni bilgi (rakip, kural, test sonucu), fikirde somut bir tasarım değişikliği, kullanıcının itirazının haklı çıkması.
- Bir puanı değiştiren bilgi başka fikirleri de etkiliyorsa hepsi aynı ölçüyle yeniden puanlanır. Tek fikri düzeltip diğerlerini eski iyimserlikte bırakmak yok.
- Her değişiklik `puanlar.md`'ye ve dosyaya not olarak yazılır: `tarih | fikir | şema | boyut | eski → yeni | neden`.
- Kullanıcının itirazı tek başına puan yükseltme sebebi değildir. Haklıysa değiştir ve aynı ölçüyü herkese uygula; haksızsa kanıtıyla savun.

## 9. Fikir ile yapılmış proje: demo günü ölçüsü

Fikir bir vaattir, gerçek proje yapılmış bir üründür. İkisi aynı ölçekte doğrudan kıyaslanınca vaat kazanır, çünkü vaadin eksiği görünmez. İlk simülasyonda Töre yapılmamış final fikrimizi iki sırada da gerçek birincinin üstüne koydu; kör sıralaması da baştan sona ters çıktı.

**Ne zaman:** fikrimiz gerçek ya da yapılmış projelerle aynı sıralamaya girdiğinde ya da onlarla karşılaştırıldığında. Simülasyonda kör sıralama, kendi derece tahminimiz ve "fikrimiz × gerçek birinci" karşılaştırması; fikir hunisinde bir fikre kalibrasyondaki birinciden yüksek puan verildiğinde (kural 2).

**Kural:** iki taraf da jürinin demo gününde gördüğüyle puanlanır.

- **Fikrimiz** tam vizyonuyla değil, **demo günü haliyle** puanlanır: takımın etkinlik süresi içinde kurup gösterebileceği gerçekçi sürüm. Takım `durum.md`'den gelir; bilgi yoksa ve simülasyonda 3 kişi. Bu hal tek paragrafta yazılır: demoda gerçekten çalışan ne, elle ya da taklitle gösterilen ne, jüri ekranda ne görür, teslimde ne olur (canlı adres, video, repo, ekran görüntüsü). Brifingde yoksa Töre puanlamadan önce kendisi yazar.
- **Demo günü hali kurulmuş sayılır.** Fikir henüz yapılmadığı için bu hal yazılır; "henüz kurulmadı", "video henüz yok" puan kırma nedeni değildir. O paragraftaki sürüm jürinin o gün göreceği ürün olarak puanlanır. Puanı kıran, kurulsa bile göstermeyeceğidir (kapsam dışı özellik, gerçek kullanıcı, dış ölçüm) ve doğrulanmamış bağımlılıktır (kural 7). Henüz seçilmemiş araç kendiliğinden doğrulanmamış bağımlılık değildir: paragraf aracı ve neden çalışacağını (belge, ön ölçüm, benzer kullanım) yazıyorsa puan kırılmaz, yazamıyorsa kırılır. Sentetik örnek dış kanıt yerine geçmez. NextGen Innovation'da (koşu c1668d4b) aynı fikir "plan" diye 2,80, "kurulup gösterilirse" 3,30 aldı.
- **Kapsam süreyi doldurur.** Demo günü hali takımın etkinlik süresinin tamamını kullanır; riski azaltmak için daraltılmış sürüm değildir. Ölçü, aynı süreli etkinliklerde kazananların gösterdiğidir. NextGen Innovation'da fikrimiz 3 kişi ve 28 günle üç sentetik tablo ve tek düzene indi, üç kazanan da kullanıcının işini baştan sona bitiren bir akış gösterdi.
- **Gerçek proje** yaptığı ve gösterdiğiyle puanlanır: canlı demo, video, repo, ekran görüntüleri, teslim metni. Kanıtı olmayan iddia vaat sayılır, puan getirmez.
- **Demo ve sunum (S4) 4,0'ı teslimdeki bağlantıdan çıkmaz.** Yapılmış projede canlı demo adresi ya da video S4'ü en çok 3,5'e taşır; 4,0 için jürinin sahnede göreceği dönüşümün kaynaklı kanıtı aranır (ekran görüntüsü, kayıt, bağımsız tekrar). İki simülasyonda S4=4 verilen 6 projenin 0'ı ödül ya da finalist oldu; kürsüdeki 6 projenin 4'ünde canlı demo yoktu.
- **Canlı demo adresi teslim şartı değilse puan nedeni olmaz.** Video ve açık repo zorunlu teslim öğesiyse canlı demo adresinin yokluğu S2'de (teknik yürütme, tamlık) puan kırmaz, S4'te (demo) en çok 0,5 kırar. Kör sıralamada ilk 10'a alma, ön eleme ya da eşitlik bozma kararı canlı demoya göre verilmez; asıl kanıt video, repo ve yeniden üretim komutudur. Syndicate by Maximor simülasyonunda (koşu 9a6848de) kürsüdeki 4 projenin 3'ünde canlı demo yoktu, kör ilk 10'daki canlı demosuz 6 projenin 5'i ödül aldı ve T1 birincisi canlı demo yüzünden eşitliği kaybedip 25'in dışına düştü; NTU InnovateX'te (koşu 7d327b6e) kürsünün 4/6'sı canlı demosuzdu ve ön eleme "demo yok" diye 3 ödüllüyü attı. Canlı demo teslim şartıysa yokluğu eksik teslimdir ve bu sınır uygulanmaz; Devfolio kartı 5b18fcbf bu etkinlikler için geçerlidir.
- **Üstüne koyuyorsan kanıtını yaz.** Fikrimizi yapılmış bir projenin üstüne koyan değerlendirme, fikrimizin demo gününde göstereceği somut kanıtı (hangi ekran, hangi canlı işlem, hangi sayı) o projenin gösterdiği kanıtın karşısına yazar. Yazamıyorsa fikrimiz o projenin altındadır.
- Kural 7'nin süre cümlesi bu kıyasta uygulanmaz: kapsamı süre belirler, çünkü karşıdaki proje de o sürede yapıldı. Doğrulanmamış bağımlılık cümlesi uygulanır.
