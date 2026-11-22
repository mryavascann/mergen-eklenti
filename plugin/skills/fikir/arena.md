# Gerçek hackathonda fikir arama

Bu dosya Adım 4'ün gerçek etkinlikteki yürütmesidir. Simülasyon bu dosyayı kullanmaz; kendi tur, durma ve seçim kuralları `simulasyon` skill'indedir.

Sıra: değerlendirme biçimi; (platform etkinliğinde) kaldıraç haritası; emsal profili; takımın ölçüsü; üretim; etiketler ve kapılar; denetimler, beğeni okuması, işaretleme ve yan yana okuma; sunum. Bir üst basamak eksikken alttakine geçilmez.

## 1. İlkeler

- **Fikir haritadan doğar.** Platform etkinliğinde fikir, genel bir kullanıcı derdinden başlayıp platformu sonradan gerekçelendirerek yazılmaz. Platformun ölçülmüş bir yeteneği ile o platformun bugünkü kullanıcısının bir işi kesiştirilir. Kulübün Monad birinciliği böyle bulundu: önce zincir üstünde çalışan bir mekanizma beğenildi (bir oyunun fizik simülasyonu), sonra "bu mekanizma oyun dışında kimin hangi işini çözer" diye soruldu; cevap, zincirin yürütme kapasitesine yaslanan bir hesaptı (aynı hesap projenin kendi ölçümünde Ethereum'da iki katından fazla gaz istiyordu). Bu bir örnektir, kalıp değildir.
- **Takımın ölçüsü ile kazananın profili ayrı şeylerdir.** Kulübün kurucu takımının aradığı fikir (kullanıcısı platformda, farkı A ya da B, dış tarafa bağlı değil, dağınık değil) beş zincir etkinliğinin açık sonuçlarıyla sınandı: ödül alan 22 projenin 5'i bu dördünü birden taşıyordu (`docs/mimari.md` §39). Ölçü takımın neyi yapmak istediğini söyler; neyin kazandığını söylemez. Mergen "bu fikir kazanmaz" ya da "bu kazanır" demez; emsalin sayılarını gösterir.
- **Etiket tarif eder, kapı eler.** Her fikir dört etiketle tarif edilir; `dağınık` dışında (kapı 1) etiket tek başına elemez. Eleyenler: etkinliğin kuralları, takımın ölçüsü, gösterim, olgular (bölüm 5), bölüm 6'daki kulüp denetimleri. Takımın beğeni defteri varsa beğeni okuması fikri elemez, ayırır: kart yapmaz, sunumun sonunda tek satırla listeler.
- **Mergen fikirleri puanla dizmez.** Puan, dört soru ve bağlamsız okurun seçimi gerçek sonuçlarla sınandı; hiçbiri kazananı güvenilir biçimde ayırmadı (`docs/mimari.md` §36 ve §39). Bunlar teşhis ve ipucudur. Puan eşiği durma koşulu ya da seçim ölçütü olamaz: kullanıcı "3,75 üstü" isterse bunu "kapıları geçen" diye çevir ve çevirdiğini söyle. Seçimi takım yapar.
- **Fikir aşamasında kod yazılmaz.** Prototip, yerel çatal, emülatör, sözleşme derleme ve arayüz bu aşamada yoktur. Doğrulama salt okunur yapılır: resmî belge, kaynak kod, blok gezgini, herkese açık RPC ve API okuması. Prototip, takım bir fikri seçtikten sonra derin analizin işidir.
- **Yön ölür, yalnız sürüm değil.** Elenen fikrin ailesi ve neden o yönün yanlış olduğu yazılır; Kayra sonraki turda bu listeyi okur.
- **Kalite tokenden önce gelir.** Gerçek oturumda tur sınırı yoktur ve simülasyonun kısaltmaları uygulanmaz. Kullanıcı süre ya da tur bütçesi verdiyse o geçerlidir.
- **Mergen kendi seçeceğini açıkça söyler.** Kapıları geçen fikirler kısa kart olarak görünür; Mergen bunların içinden kendi seçeceklerini işaretler. İşaretlemediği fikri öneri, finalist ya da "araştırma adayı" diye sunmaz; kapıdan geçmeyeni hiç sunmaz.

## 2. Değerlendirme biçimi

Fikir üretmeden önce etkinliğin her aşaması için (ön eleme, yerel gösterim, final, çevrimiçi teslim) şunları kaynağıyla `durum.md`'ye yaz: kararı kim veriyor (jüri, katılımcıların oyu, karma; payları), hangi ölçütle, neyi okuyarak, izleyerek ya da bizzat deneyerek, ne kadar sürede. Güncel organizatör kuralı esastır; takımın önceki baskı deneyimi ve aynı serinin başka şehirdeki baskısı tarihli ipucudur. Biçim bilinmiyorsa açık bırak ve ürünün değerini izleyenden hiçbir eylem beklemeden anlatan teslimi varsay.

- **README ya da başvuru incelemesi:** ilk paragraf sorunu ve sonucu söyler; ardından gerçek bir örneğin öncesi ve sonrası gelir. Okurun bir şey kurması ya da cüzdan bağlaması gerekmez.
- **Kayıtlı video ya da ekip sunumu:** ürünü ekip kullanır. İzleyen girdiyi, mekanizmayı, çıktıyı ve neden önemli olduğunu sürenin içinde anlar.
- **Katılımcı oyu:** oy veren, kendi projesini bitirmeye çalışan başka bir ekiptir; yayımlanmış oy ölçütü jüri rubriği gibi okunur ve brifinglere aynen taşınır.
- **Uygulamalı değerlendirme:** jürinin ya da ziyaretçinin ürünü bizzat kullanacağı organizatörce doğrulandıysa o aşamaya bir deneme eklenir. Seyirci oyu, yüz yüze salon ya da "çalışan ürün" şartı tek başına bunun kanıtı değildir.

Jüriye ya da seyirciye iş yaptıran sahne (girdi seçtirmek, QR okutmak, oynatmak) yalnız doğrulanmış uygulamalı aşama için yazılır. `fikir` bölüm 2'deki salon girdisi, salondaki kullanıcı ve güncel araç sayımları ile Kayra'nın "jüri ilk 30 saniyede kendi girdisiyle" ölçüsü gerçek etkinlikte yalnız böyle bir aşama varsa uygulanır. Bu biçimi Kayra, Töre, Kurultay ve Atabey brifinglerine sen taşırsın; onların dosyaları biçimi bilmez.

## 3. Harita ve emsal

### Kaldıraç haritası (platform etkinliği)

Bir platform, zincir ya da teknoloji zorunluysa ya da etkinliğin ana hedefiyse uygulanır. Harita `pano/kaldirac.md`'dedir ve Adım 1–3'te kurulur (`hackathon` bölüm 2.1):

1. **Yetenekler (Bilge):** `yetenek | ölçüsü (sayı, sürüm, kaynak) | en güçlü iki rakipte durumu (sayıyla) | bu farkın mümkün kıldığı iş (rakipte sığmaz / kat kat pahalı / üçüncü tarafa güven ister) | kanıt`.
2. **Bugünkü kullanıcılar ve işleri (Börü):** `kesim | bugün platformda yaptığı iş (protokol, hacim ya da sayı) | takıldığı yer (kaynak) | bugünkü geçici çözümü | sinyal gücü`.
3. **Organizatörün ölçüsü (Kam):** organizatörün ve ekosistemin açıkça istediği yönler, kaynağı ve tarihiyle.

"Hızlı" ve "ucuz" tek başına yetenek değildir. Ölçülmüş bir eşik etkisi ise yetenektir: adı konmuş bir hesap ya da etkileşim rakipte bir bloğa, bir işleme ya da makul bir ücrete sığmıyor ve burada sığıyorsa, sayılarıyla yazılır.

Yetenek tablosunda rakiple sayıyla kıyaslanmış en az beş satır ve kullanıcı tablosunda kaynaklı en az beş kesim yoksa eksik tabloyu ilgili ajana geri gönder. Eksik haritayla fikir yazdırma.

### Emsal profili (her gerçek etkinlik)

Bitigçi aynı organizatörün geçmiş teslimlerini iki dosyaya yazar: `pano/emsal-liste.md` (`no | proje | teslim metni`; sonuç ve bağlantı yok) ve `pano/emsal-sonuc.md` (`no | derece ya da ödül | bağlantı | kaynak`). Sonra:

1. Kurultay'ı kör okur modunda çağır: yalnız `pano/emsal-liste.md`'yi ve aşağıdaki emsal tanımlarını ver, başka hiçbir şey verme. Sonucu bilen etiketlemez: sen ve Bitigçi etiketlemezsiniz.
2. Etiketleri sonuçlarla birleştir ve `pano/kaldirac.md`'ye (açık konulu etkinlikte `pano/emsal-profil.md`'ye) say olarak yaz: `etiket değeri | ödüllülerde kaç / kaç | ödülsüzlerde kaç / kaç`. Başına şunları yaz: emsalde kararı kim verdi ve bu etkinliktekiyle aynı mı; kaç ödüllü var; emsal başka organizatörden mi.
3. Sayıları yorumlama: "öne çıkan", "geride kalan" gibi işaret koyma. Ödüllü proje sayısı yirmiden azsa bir iki projelik fark gürültüdür. Profilin iki işi vardır: takıma ölçüsünün bedelini göstermek (bölüm 5) ve sunumda fikrin yanına konmak (bölüm 7).

Emsal tanımları (yalnız teslim metninden okunur; açık konulu etkinlikte ilk ikisi atlanır):

- **Kullanıcı:** `platformda` (platformu bugün kullanan bir kesim: alım satım yapan, likidite sağlayan, borç veren ya da alan, stake eden, doğrulayıcı işleten, geliştirici, zincir üstü oyun ve koleksiyon kullanıcısı) ya da `dışarıdan` (öğrenci, esnaf, kurum, genel tüketici).
- **Fark:** `A` (iş başka zincirde ya da zincirsiz yapılamıyor ya da anlamlı biçimde kötüleşiyor ve proje bunu platformun belirli bir yeteneğine bağlıyor), `B` (iş başka zincirde o zincirin kullanıcısı için de kurulabilir; burada olmasının nedeni kullanıcının ve varlığın burada olması), `yok` (zincirsiz de aynı çalışır; platform yalnız kayıt, makbuz ya da ödeme rayıdır; ya da gerekçe her zincir için söylenebilir). "Hızlı" ve "ucuz" tek başına yetenek sayılmaz.
- **Bağımlılık:** `kendi başına` (herkese açık durum ve arayüzlerle ve kullanıcının kendi hesabıyla çalışır; açık bir API ya da hazır protokol kullanmak bunu bozmaz) ya da `dış taraf gerekir` (bir kurumun, ortağın, özel iznin, kapalı verinin ya da fiziksel bir ağın gelmesini bekler).
- **Odak:** "⟨kullanıcı⟩ artık ⟨iş⟩ yapabiliyor; bugüne kadar yapamıyordu çünkü ⟨neden⟩." Üç boşluk doluyorsa `yeni iş`; neden doldurulamıyorsa `iyileştirme`; tek bir kullanıcı ve iş söylenemiyorsa `dağınık`.

Emsal bulunamıyorsa "profil yok" yaz ve neyin ödüllendirildiğine dair cümle kurma.

## 4. Üretim

İlk turda Kayra en az 12 fikir yazar. Brifingine haritayı, takımın ölçüsünü ve varsa beğeni defterini (bölüm 5) ve aile defterini ver. Fikirler takımın ölçüsünü karşılayacak biçimde yazılır.

Platform etkinliğinde her fikir haritadaki bir kesişimden doğar ve kartının başında şu dört satır bulunur:

- **Kaldıraç:** yetenek tablosunun hangi satırı.
- **Kullanıcı:** kullanıcı tablosunun hangi kesimi ve bugün yaptığı iş.
- **Başka zincirde:** aynı iş en güçlü rakipte yapılınca ne olur (sayıyla).
- **Zincirsiz:** aynı iş sıradan bir sunucuyla yapılınca ne kaybedilir.

Bir satırın dürüst cevabı "yok" ya da "aynı çalışır" ise öyle yazılır; her zincir için söylenebilen gerekçe ("site kapanınca kayıt kalır", "sahiplik kullanıcıda", "şeffaf") bu satırları doldurmaz. Fikirler en az dört ayrı yetenek satırından ve dört ayrı kullanıcı kesiminden gelir. Üretim yolları: yetenek × kesim kesişimi; organizatörün işaret ettiği yön; bir kazananın ya da ekosistemde beğenilen bir ürünün mekanizmasını başka bir platform kullanıcısının işine taşımak (girdi ve gözlenen sonuç iki kullanımda da yazılır; yalnız sektör adı değişiyorsa bırakılır); takım üyelerinin bu platformun kullanıcısı olarak bizzat yaşadığı takılma (`durum.md`'deki "Takımın kendi dertleri"; kulübün bir projesi böyle seçildi: fikir ilk puanlamada gerideydi, takım onu kendi yaşadığı dert yüzünden seçti).

Açık konulu etkinlikte harita yoktur: fikirler `fikir` bölüm 2'deki tarama yollarıyla ve takımın kendi dertlerinden üretilir; kartın başında dört satır yerine tek satır bulunur: **Sade çözüm:** aynı iş bugünkü en güçlü hazır çözümle yapılınca ne eksik kalır.

En çok iki kontrast fikir türüyle yazılabilir; kontrast önerilmez. Takım benzerlikten ya da heyecan eksikliğinden yakındıysa Kayra'nın ilk çağrısına eski liderleri ve puanları verme; aile defterini ver. Aynı fikri yeni adla getirmek tur sayılmaz.

## 5. Etiketler, takımın ölçüsü ve kapılar

Mergen her fikri önce etiketler, sonra kapılardan geçirir ve sonucu `pano/kapilar.md`'ye yazar: `fikir | kullanıcı | fark | bağımlılık | odak | kurallar | ölçü | gösterim | olgular | karar | kararı değiştirecek tek gözlem`.

### Etiketler

Dört etiket bölüm 3'teki tanımlarla aynıdır; kendi fikirlerimizde harita elde olduğu için iki ek koşul aranır: `platformda` için kesimin o işi bugün platformda yaptığının kaynağı ya da sayısı kullanıcı tablosunda durur; `A` için dayanak yetenek tablosunun yürütme, ücret, durum modeli ya da yerleşik protokol satırında sayıyla durur. Yalnız ekosistemde biriken varlığa, likiditeye ya da veriye yaslanan fikir `B`'dir. Bu ek koşullar yüzünden kendi etiketlerimiz emsalinkinden sıkıdır; yan yana gösterirken bunu söyle.

### Takımın ölçüsü

Hangi etiket değerlerinin bu takım için şart olduğunu takım söyler; `durum.md`'ye "Takımın ölçüsü" başlığıyla yazılır.

- Oturumun başında sorulur (`hackathon` bölüm 1): kullanıcı platformda mı olmalı; fark en az hangi sınıf olmalı; dış tarafa bağlı fikir istenir mi; iyileştirme kabul mü. Bu makinedeki önceki etkinlik klasörlerinde yazılı bir ölçü varsa onu öner ve onaylat. Örnek, kurucu takımın ölçüsü: kullanıcı platformda; fark A, ya da kullanıcı tablosundaki sinyali güçlü olan B; kendi başına.
- Takımın adını anmadığı etiket elemez; yalnız sunumda görünür. Takım hiç ölçü vermediyse `dağınık` dışında (kapı 1) hiçbir etiket elemez.
- Emsal profili çıkınca (Adım 2'den sonra) ölçüyü onunla yan yana koy ve bir kez söyle: emsalde ödül alan projelerin kaçı bu ölçüyü karşılıyordu, karşılamayanlar hangi etikette ayrılıyordu. Karar takımındır; söyledikten sonra ölçüyü tartışmaya açma.
- Ölçüye takılan fikrin elenme nedeni "takımın ölçüsü" diye yazılır.

### Beğeni defteri

Dört etiket takımın beğenisinin tamamını anlatmaz. Takım geçmiş fikirlere verdiği tepkileri kendi sözleriyle tutuyorsa (`fikir | tek cümlesi | platformla ilişkisi | tepkisi, aynen | hüküm: reddetti / olabilir / beğendi | neden`, ve fikirler hakkındaki genel sözleri) bu beğeni defteridir. Defter takıma aittir: etkinlik klasörlerinin dışında, takımın seçtiği yerde duran yerel bir dosyadır; yolu `durum.md`'de yazar; havuza ve depoya girmez. Defter fikre verilen tepkiyi tutar: puana verilen tepki ("düşük geldi", "4 üstü olsun") fikir tepkisi olarak girmez.

- Defter üretimde okunur (bölüm 4) ve beğeni okumasında kullanılır (bölüm 6).
- Defter her oturumda büyür: takımın bir fikre verdiği her tepki, alıntısı, hükmü ve nedeniyle deftere eklenir; beğeni okumasının o fikir için tahmini de yanına yazılır (ayrılan fikirler sunumda listelendiği için tutmayan tahmin görülebilir). Defteri yorumla doldurma; yalnız takımın sözü girer.
- Takımın beğendiği bir örnek geldiğinde (kendi projesi, başkasının projesi, bir mekanizma) onu iyi yapan şeyi adlandır, takıma sor ve yalnız onayladığını deftere genel söz olarak ekle.
- Defter yoksa ya da tepki satırı ondan azsa beğeni okuması yapılmaz; oturumun sonunda takımın bu oturumdaki tepkileriyle defteri başlatmayı öner.

### Kapılar

Sırayla sorulur; fikir ilk takıldığı kapıda durur.

1. **Kurallar:** etkinliğin kuralları, takımın `durum.md`'deki bu etkinliğe özel ŞART'ları ve girmediği alanlar, ve `tercihler.md` madde 1 (tek kullanıcı, tek ana akış). `dağınık` fikir Kayra'ya bir kez daralttırılır; daralmıyorsa elenir.
2. **Ölçü:** takımın ölçüsündeki şart koşulan etiket değerleri. `tercihler.md` madde 3 (platforma yaslanma) gerçek platform etkinliğinde yalnız burada, takım ölçüsüne koyduysa uygulanır.
3. **Gösterim:** değer, etkinliğin teslim biçiminde (bölüm 2) izleyenden bir şey istemeden gösterilebiliyor mu ve ekip bunu süresinde kurabilir mi? (`tercihler.md` madde 2 budur.)
4. **Olgular:** fikri taşıyan iddiaları `iddia | kaynak | doğrulandı / varsayım` diye yaz ve salt okunur doğrula. Taşıyıcı bir iddia varsayım kaldıysa karar "araştır"dır.

Karar üç türlüdür: **geçti**, **araştır** (yalnız olgularda tek bir gözlem eksik; gözlem ve nasıl bakılacağı yazılır), **elendi**. Araştırılan fikrin gözlemi aynı turda aranır; bulunamıyorsa fikir elenmiş gibi işlenir.

Elenen her fikir için `pano/aileler.md`'ye satır yaz: `aile | takıldığı kapı (ölçüyse hangi etiket) | bu yön neden yanlış (yalnız bu sürüm değil) | ne olursa dirilir`. Kayra her turda bu dosyayı okur; ölü bir aileden fikir, diriliş koşulu sağlanmadan yazılmaz. Kullanıcının bir fikri reddederken söylediği neden de buraya ve `fikir` bölüm 5'teki ders defterine `kullanıcı` türüyle girer; aynı neden iki kez geldiyse takımın ölçüsüne madde olarak eklemeyi öner.

## 6. Denetimler, işaretleme ve yan yana okuma

Yalnız kapıları geçen fikirler buraya gelir. Sıra aşağıdaki gibidir; 4–7. adımlar yalnız işaretli fikirlere uygulanır. Takım işaretsiz bir kartı derinleştirmek isterse o kart da aynı adımlardan geçer.

1. **Kulüp denetimleri:** `fikir` bölüm 3'ün itiraz ön filtresi, Yabancı testi ve benzer kontrolü (adım 3–5; `tercihler.md` madde 4 ve 5 burada uygulanır). Yankı'ya kulübün bu makinedeki öteki etkinlik klasörleri de taratılır: başka bir etkinlik için önerilmiş bir fikir yeni adla gelmişse elenir. Burada elenen fikir de aile defterine yazılır.
2. **Beğeni okuması** (beğeni defteri varsa): Kurultay'ı kör okur modunda üç kez, birbirinden habersiz çağır; her çağrıya yalnız beğeni defterini ve kalan fikirlerin kısa kartlarını (ad, tek cümle, platformla ilişkisi; puan ve sıra olmadan) ver. Her fikir için takımın ne diyeceğini tahmin eder: `reddeder`, `olabilir` ya da `beğenir`, dayandığı defter satırı ve takımın ağzından tek cümle nedenle. Üç okumanın en az ikisi `reddeder` diyorsa fikir **ayrılır**: kısa kart olmaz ve işaretlenmez; sunumun sonunda "beğeni okumasının ayırdıkları" başlığında tek satırla (ad, tek cümle, dayandığı defter satırı) listelenir. Ayrılan fikir aile defterine takıldığı kapı sütununda "beğeni okuması (tahmin)", diriliş koşulu sütununda "takım görmek isterse" diye yazılır ve aileyi öldürmez; takım görmek isterse kart yapılır ve tahminin tutmadığı deftere yazılır. Bu okuma takımın tepkisini tahmin eder, kazanmayı değil. Sınamada sonuç tam eşikte kaldı ve tek bir belirsiz satıra bağlıydı (`docs/mimari.md` §39, Sınama 3); bu yüzden okuma elemez, yalnız ayırır.
3. **İşaretleme:** kalan fikirler içinden Mergen kendi seçeceği en çok üçünü işaretler ve her biri için tek cümle gerekçe yazar. Bunu Töre okumadan önce yapar: işaret bir yargıdır, puana dayanmaz ve takıma öyle söylenir.
4. **Emsal yan yana:** işaretli her fikir için etkinliğin teslim biçiminde tek paragraf yaz ve emsalin en üst derecedeki (en çok üç) ödüllü projesinin teslim metniyle yan yana koy. Hüküm yazma; takım okur.
5. **Töre (teşhis):** onaylı rubrikle üç bağımsız okuma (`fikir` bölüm 3, adım 6). Töre'ye eski puanlar ve sıralar gösterilmez. Sonuç orta değer ve aralıkla, "teşhis" başlığı altında durur; fikir aşamasında hiçbir fikrin gösteremeyeceği şeyler (yazılmış kod, depo, canlı kullanıcı) için puan kırılmaz. Töre'nin rakip testi ölçülmüş eşik etkisini tanımaz; `A` etiketli bir fikrin o boyuttaki puanı bu yüzden düşük çıkabilir, teşhise bunu yaz. Aynı kuralın "önerilmez" hükmü gerçek platform etkinliğinde uygulanmaz; platforma yaslanma burada yalnız takımın ölçüsüyle eler. 0,2'den küçük puan farkı fark değildir.
6. **Bağlamsız okur (ipucu):** Kurultay'a kör okur modunda, işaretli fikirleri ve emsaldeki ödüllü projeleri karışık ve etiketsiz ver; her biri iki cümledir (ne yapıyor, kimin için), emsal metni de bu iki cümleye indirilir. Yayımlanmış ölçüte göre, çalışırken görmeyi en çok isteyeceği üçünü seçsin. Sınamada bu okuma kazananı güvenilir biçimde bulmadı ve seçtikleri çoğunlukla listedeki en uzun kayıtlardı; sonucu "ipucu" diye göster, işaretlemeyi buna göre değiştirme.
7. **Kurultay sorgusu** (`fikir` bölüm 3, adım 7) işaretli fikirlere uygulanır; kapıyı kaldırmaz.

## 7. Sunum, devam ve kapanış

Kapıları ve denetimleri geçen bütün fikirler takıma kısa kart olarak sunulur: en çok on iki, puana göre dizilmeden, aileleriyle gruplanmış. Kazananı ayıran doğrulanmış bir sıralayıcı olmadığı için listeyi üçe indirmek, takımın seçeceği fikri kesebilir. Kısa kart: tek cümle (odak cümlesi); kullanıcı ve kanıtı; kaldıraç, sayısıyla; başka zincirde ne olur (açık konulu etkinlikte bu iki satır yerine sade çözüm satırı); teslim biçiminde nasıl gösterilir; en büyük açık; etiketleri. On ikiden çok fikir geçtiyse önce aynı aileden en çok ikisi, yine aşıyorsa aile başına biri kart olur; işaretli fikir her durumda kart olur; kart olmayanlar tek satırla listelenir, hiçbiri gizlenmez. Beğeni okumasının ayırdıkları en sonda, kendi başlığı altında tek satırla durur.

Mergen'in işaretlediği fikirler (bölüm 6) kartın başında gerekçesiyle belirtilir ve onlar için ayrıca verilir: etiket değerlerinin emsalde ödüllü ve ödülsüz kaç projede görüldüğü; emsal yan yana paragrafı; teşhis (puanın orta değeri ve aralığı) ve ipucu. Sonra sor: "Hangilerini derinleştirelim, neden? Hiçbiri de olabilir." Cevabı gerekçesiyle `durum.md`'ye ve aile defterine yaz.

- Kullanıcı bir sayı ya da nitelik istediyse ("üç fikir bulana kadar") bu, bitiş koşuludur: haritada denenmemiş kesişim kaldıkça üretmeye devam et; durup kısmi sonuç sunma. Beğeni okumasının ayırdığı fikir bu sayıya girmez. Kesişimler tükendiyse haritayı genişlet (yeni yetenek satırı, yeni kesim) ve sürdür.
- Açık bir koşul yoksa ilk üretimi izleyen en az iki öğrenme turu yapılır. Ardından iki tur üst üste geçen fikir listesi değişmiyorsa kapat.
- Harita da tükendiyse ya da bütçe bittiyse dur ve yön raporu ver: hangi aileler hangi kapıda öldü, hangi kesişimler denendi, haritada ne eksik, ölçünün hangi maddesi en çok fikri eledi ve o madde emsalde kaç ödüllü projede karşılanıyordu. "Bu turda önereceğim proje çıkmadı" cümlesi tek başına rapor değildir.
- İç turlar tek adımdır; kullanıcının kararı gerekmeden durulmaz (`surec` bölüm 8). Her biten aşamada `durum.md`'ye tur, son aşama, üretilen dosyalar ve sıradaki iş yazılır; kesintide ilk eksik aşamadan sürdürülür.
- Takım bir fikri seçince derin analize (`derin`) geçilir. Seçilen fikri geliştirmek istenirse aynı kullanıcı ve aynı sonuç korunur; eski ve yeni sürüm aynı kapılardan geçer ve yan yana gösterilir.

## 8. Dosyalar

`pano/kaldirac.md` (harita ve emsal profili; açık konulu etkinlikte profil `pano/emsal-profil.md`'dedir), `pano/emsal-liste.md` ve `pano/emsal-sonuc.md` (emsal), `fikirler.md` (bütün turların ham fikirleri), `pano/kapilar.md` (etiketler ve kapı kararları), `pano/aileler.md` (aile defteri), `pano/ders-defteri.md` (`fikir` bölüm 5), `puanlar/` (Töre okumaları), `durum.md` (değerlendirme biçimi, takımın ölçüsü, beğeni defterinin yolu, takımın kendi dertleri, bitiş koşulu). Çalışma dosyasında takımın ilk gördüğü bölüm kısa kartlardır; elenenler ve eski puanlar tarihli arşivde durur.
