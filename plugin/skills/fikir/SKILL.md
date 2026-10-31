---
name: fikir
description: Mergen fikir hunisi (Adım 4). Kayra geniş bir fikir kümesi yazar, Mergen kalitesini denetler; fikirler kulübün itiraz kütüphanesinden ve Yabancı testinden geçer, Yankı benzerini arar, Töre üç bağımsız turda puanlar, Kurultay jüri personalarıyla sorgular ve derin analize girecekler birlikte seçilir. Kullanıcı bir hackathon için fikir bulmak, fikir üretmek, beyin fırtınası yapmak, yeni bir fikir turu ya da bir fikrin varyantlarını istediğinde kendiliğinden kullan.
argument-hint: "[yön ya da not, isteğe bağlı]"
---

# Fikir hunisi

Önce oku: `${CLAUDE_PLUGIN_ROOT}/skills/surec/SKILL.md`, `${CLAUDE_PLUGIN_ROOT}/skills/puanlama/SKILL.md`, `${CLAUDE_PLUGIN_ROOT}/skills/juri/SKILL.md`, `${CLAUDE_PLUGIN_ROOT}/skills/fikir/tercihler.md`, `${CLAUDE_PLUGIN_ROOT}/skills/fikir/kartlar.md`.

Kullanıcının notu: $ARGUMENTS

## 0. Ön koşul

`durum.md`'yi oku. Oturum yoksa ya da Adım 1–3 yapılmadıysa, kullanıcıya bunun neden önemli olduğunu tek cümleyle söyle ve `hackathon` skill'iyle araştırmayı başlat; araştırmasız fikir hunisi yalnız kullanıcı açıkça isterse yapılır ve dosyada "araştırmasız" diye işaretlenir.

Alan profili, iki şemanın tanımları, Şema 2 ağırlıkları ve fren eşikleri onaylı değilse dur ve onayı iste. Kullanıcı "onaysız devam" derse eşit ağırlıkla devam et ve dosyada "onaysız" diye işaretle.

## 1. Hazırlık

- Panodaki Adım 1–3 notlarının hepsini, `pano/personalar.md`'yi ve `pano/havuz.md`'yi kendin oku; Kayra'nın çıktısını denetlerken bunlara ihtiyacın olacak.
- **Fikirleri Kayra yazar** (`mergen:kayra`, Opus). Geçmişte fikir işi bir alt ajana madde listesi özetiyle verildi; çıkan fikirler dar ve zayıftı. Bu yüzden Kayra'ya özet değil, oturum klasörünün yolunu verirsin; bütün araştırmayı kendisi okur. Sen fikir yazmazsın; Kayra'nın fikirlerini denetler, gerekirse geri gönderirsin. Fikri yazan ile denetleyen ayrı olunca denetim daha dürüst olur.
- İtiraz listesini tazele: `veto_list` (havuz) + `durum.md`'deki "Oturum itirazları". Aşama süzgecini uygula (`juri` bölüm 3).

## 2. Genişlik (ilk tur)

Bu kurallar Kayra'nındır; sen denetimde bunlara göre bakarsın.

- En az 15 fikir, en az 5 farklı kullanıcı ailesinden ya da ürün biçiminden.
- Şu tarama yollarının her birinden en az bir fikir:
  1. Boşluk haritasındaki boş alan × platformun ender primitifi.
  2. Başka platformda talebi kanıtlanmış bir ürünün buradaki karşılığı.
  3. Bir kazanan paterninin yeni bir alana taşınması.
  4. Bir kullanıcı şikâyetinin doğrudan çözümü.
  5. Platformun rakipte olmayan tek bir yeteneğini sonuna kadar zorlayan fikir.
  6. Organizatörün ya da sponsorun açıkça işaret ettiği bir yön.
  7. Kullanıcının "aklımdaki yönler"i (varsa).
  8. Havuzdaki bir tarif kartının bu hackathona uygulanması (varsa).
  9. **Kulüp fikirleri** (havuzdaki `idea` kartları, varsa). Bunlar üyelerin WhatsApp grubunda konuşarak olgunlaştırdığı ve yöneticinin onayladığı fikirlerdir.
     - Bu hackathona uyan her kulüp fikri huniye girer: Kayra onu olduğu gibi alır ya da buraya uyarlar (varyant yazar). Uymayanlar için nedenini tek cümleyle `fikirler.md`'ye yazar.
     - Kulüp fikri sıradaki bütün adımlardan (itiraz, Yabancı, Yankı, Töre, Kurultay) diğer fikirlerle aynı ölçüyle geçer; ayrıcalığı yoktur.
     - Kısa kartında kaynağı "kulüp fikri, kart `#kısa-id`" diye yazılır.
     - Bir fikri belirleyen ya da elenmesine yol açan kulüp fikri kartı `durum.md`'deki "Kullanılan havuz kartları"na girer.
     - Ajanların değerlendirmesi (uyarlandı / elendi ve neden) oturum sonunda kullanıcıya kısaca söylenir: kulüp, fikrinin ne olduğunu görür.
- **Tema sınırı:** aynı temadan (aynı kullanıcı sorunu, aynı primitif ya da aynı kaynak) gelen fikirler toplamın üçte birini geçmez. Organizatörün bir yazısı, tek bir kazanan ya da kullanıcının beğendiği bir satır huninin teması olamaz; yalnız girdidir.
- Kullanıcının "girmediğimiz alanlar"ına giren fikir yazılmaz.
- 2–3 kontrast fikir ekle ve türünü yaz: kalabalık kalıbın en iyi hali, çok basit bir fikir ya da bir ŞART'a uymayan ama kıyas için yararlı bir fikir.
- Aynı motoru paylaşan fikirleri "aile" diye işaretle.
- **Önceki çalışma dosyası** varsa: oradaki fikirler bu huniye alınır ve baştan puanlanır; "en az 15" sayısına girer ama tek başına yetmez: her tarama yolundan en az bir **yeni** fikir de yazılır. Önceki huni dosyada "önceki tur" olarak kalır, eski puanların yanında "eski düzen" yazar.

## 3. Sıra

1. **Fikirleri yazdır.** Kayra'yı tur modunda çağır. Brifinge: oturum klasörünün yolu, tur numarası, kullanıcının notu ve yönü ($ARGUMENTS), kenarda ve rafta olanlar, `pano/ders-defteri.md` (varsa), itiraz listesi (aşama süzgecinden geçmiş), önceki çalışma dosyası varsa linki, çıktı yeri (`fikirler.md` içinde "Tur N" bölümü).
2. **Kalite denetimi (Mergen).** Kayra'nın fikirlerini kendin oku ve şu listeyle denetle: sayı ve aile çeşitliliği; her tarama yolu temsil ediliyor mu; tema sınırı; girmediğimiz alanlar; kontrast fikirler ve türleri; kısa kartların her satırı dolu mu; ŞART'lara aykırı fikir var mı; süreç sızıntısı (oylama, onay, puanlama, persona, havuz, çok ajanlı yapı fikre gerekçesiz girmiş mi; fikirler Mergen'e benziyor mu); dayanaklar kaynaklı mı; `kullanıcı` türündeki bir derse takılan fikir var mı (bölüm 5). Eksik varsa somut notlarla Kayra'yı **bir kez** düzeltme modunda çağır; sonra kalan eksikleri dosyaya yazarak ilerle.
3. **İtiraz ön filtresi.** Kurultay'ı (`mergen:kurultay`) **itiraz modunda** çağır (`juri` bölüm 3): brifinge yalnız aşama süzgecinden geçen itirazlar ve kısa kartlar girer. Fikirleri 8'erli gruplara bölüp paralel çağırabilirsin. Kurultay dosya yazamaz: sonucu cevabından sen `pano/`ya (örn. `pano/huni<N>-itiraz-<grup>.md`) yazarsın. Sonucu tabloya yaz: `fikir | takıldığı itirazlar (kart no) | düzeltme | ikinci kontrol`. Takılan fikirleri Kayra'ya düzeltme modunda (itiraz sonuçlarıyla) gönder; somut bir tasarım değişikliğiyle düzeltilenleri bir kez daha kontrol ettir; yine takılırsa "itirazla elendi" listesine al. Bu fikirler kullanıcıya tam kart olarak gösterilmez; liste halinde, takıldığı itirazla görünür ve kullanıcı isterse geri alınır. Bu adım, kulübün elle yaptığı "jüri bunu der" elemesinin öğrenilmiş halidir.
4. **Yabancı testi.** Kalan her fikir için Yabancı'ya (`mergen:yabanci`) **yalnız fikrin adını ve tek sahne tarifini** ver; tek cümleyi, kullanıcıyı ve diğer satırları verme. Birden çok fikri numaralı ve birbirinden bağımsız olarak tek çağrıda verebilirsin. Yabancı'nın "ne yapıyor, kimin için" anlatımını fikrin tek cümlesiyle karşılaştır: **tam**, **kısmen** ya da **uyuşmuyor**. Uyuşmuyorsa Kayra'ya tek sahne tarifini **bir kez** yeniden yazdır ve yeniden dene. Sonuç `puanlama` kural 8'e göre işlenir: "uyuşmuyor" kalan fikir anlatılabilirlik ŞART'ına takılır.
5. **Benzer kontrolü.** Yankı'yı (`mergen:yanki`) çağır: her fikir için üç yerde benzer arasın. Fikirleri 4–5'lik gruplar halinde paralel Yankı çağrılarına bölebilirsin; her grup kendi dosyasına yazar: `pano/huni<N>-yanki-<grup>.md`.
6. **Puanlama.** Töre'yi (`mergen:tore`) `puanlama` bölüm 5'e göre **üç paralel, bağımsız turda** çağır. Her tura aynı girdiler: onaylı şemalar ve tanımlar, karne, kalibrasyon tablosu, kısa kartlar, itiraz sonuçları, Yabancı testi sonuçları, benzer kontrolü dosyalarının yolları. Her turun çıktı yolu ayrı: `puanlar/huni<N>-tur1.md`, `-tur2.md`, `-tur3.md`. Sonuçları birleştir: orta değer, aralık, "belirsiz" işaretleri, fren.
7. **Jüri simülasyonu.** Hackathon puanına göre ilk 6 fikir için Kurultay'ı `juri` bölüm 2'deki protokolle çağır: seçilen üç persona, fikir başına üç paralel ve birbirinden habersiz çağrı. Fren bu seçimde kimseyi elemez; frenli fikir sırası geldiyse girer (`puanlama` bölüm 6). Cevapları `pano/kurultay-huni<N>.md`'ye yaz ve sentezi fikir kartlarına işle.
   - **Ölçek:** huni aşamasında personalar her fikre 1–5 güven puanı verir ve dörder fikirlik gruplarda "hangisi finalde ilk 3'e girer" göreli sorusuna yanıt verir (`juri` bölüm 2). Fikirleri geçer/şüpheli/eler sayısıyla seçme; güven puanı ortalaması ve göreli seçimler sıralar, eşitlikte Hackathon puanı bakar. Brifinge "net karar ver" notu yetmez, ölçek verilir.
   - **Joker:** frene yalnız tek bir karne boyutu yüzünden takılan (Karne puanı eşiği geçiyor, eşiğin altında tek boyut var) ve başka bir nedenle (itiraz, ŞART, kopya) elenmemiş fikirlerin Hackathon puanı en yüksek olanı listede değilse, o da Kurultay'a 7. fikir olarak gider. Böyle fikir yoksa ya da zaten listedeyse joker yeri boş kalır.
   - Jokerin puan tablosunda ve kartında `joker · fren: <boyut> <puan>` bayrağı durur. Bayrak Kurultay brifingine girmez; personalar puan görmez (`juri` bölüm 2).
   - Fren derin analizde ve final seçiminde geçerli kalır; jüri sonucu freni aşmayı haklı çıkarıyorsa gerekçesi `puanlama` bölüm 6'ya göre yazılır.
8. **Tam kartlar.** Hackathon puanına göre ilk 8 fikrin ve Kurultay'a giden jokerin kartını Kayra'ya tam kart modunda genişlettir; puanları, itiraz, Yabancı, benzer ve jüri sonuçlarını kartlara sen işle.
9. **Kürsü ön kıyası.** Hackathon puanına göre ilk 3 fikrin demo günü halini Töre'yle kürsü projelerine karşı iki sırada kıyasla (`puanlama` bölüm 10). Demo günü paragrafını sen yaz, iki çağrıya aynısı gider. Proje, Töre iki sırada da `fikir` derse geçilmiş sayılır; tam protokol derin analizdedir (`derin`). Cümleleri ders defterine yaz, kürsüyü geçemeyen fikirleri durakta söyle.
10. **Dosya ve durak.** Ders defterini güncelle (bölüm 5); dosyanın 13. bölümünü bu turla güncelle; `durum.md`'yi güncelle; durak mesajını yaz.

## 4. Çıktı (dosyada)

1. Bu tur için çekilen yeni veriler tablosu.
2. **İtiraz ön filtresi sonucu:** takılan, düzeltilen ve elenen fikirler.
3. **Puan tablosu:** bütün fikirler, Hackathon puanına göre sıralı. Sütunlar: aile ve tema; Şema 1 boyutları ve Hackathon puanı (orta değer ve aralık); bonuslar; Şema 2 boyutları ve Karne puanı; fren; Yabancı testi; jüri kararları (güven puanı ortalaması ve göreli seçimler; derin analizde geçer/şüpheli/eler); tercih uyumu.
4. Fikir kartları (tam ve kısa).
5. Aileler.
6. Kart açmadan elenenler: `fikir | neden elendi`.
7. **Katmanlar:** tek başına ürün olmayan ama hangi fikri seçersek seçelim üstüne konabilecek parçalar: `katman | ne ekler | hangi ölçüte ya da karar verene yarar`.
8. **Ortak iskelet:** üst sıradaki fikirlerin paylaştığı parçalar. Kurallar değişirse fikir değişir, iskelet kalır.
9. **Turun önerisi:** derin analiz için 3 fikir, mümkünse üç ayrı aileden; "neden bu üçü, neden diğerleri değil".

## 5. Ders defteri: kullanıcıdan ve elemelerden öğrenmek

Bu, huninin hafızası ve itiraz kütüphanesinin büyüme yoludur; atlama.

- Kullanıcı bir fikri bıraktığında ("bunu ele", "jüri bunu sevmez") nedenini tek cümleyle yaz ya da kısaca sor.
- Neden genelleştirilebiliyorsa (başka fikirlere de sorulabilecekse) onu evet/hayır test sorusuna çevir ve `durum.md`'deki "Oturum itirazları"na ekle. Bu turdan itibaren ön filtrede kullan.
- Oturumun sonunda (ya da kullanıcı isterse hemen) bu itirazları `tecrube-karti` skill'ine göre `veto` kartı olarak öner; onay gelirse `card_submit` ile gönder.
- Aynısını olumlu kararlar için de yap: kullanıcı bir fikre "bunu kullanırım", "ekipler bunu ister" dediğinde nedenini tek cümleyle `durum.md`'deki "Oturum itirazları"nın altına "Beğenme nedenleri" olarak yaz. Kulüpteki ürün sezgisi buradan birikir; genelleştirilebilenleri oturum sonunda `lesson` ya da `recipe` kartı olarak öner.

**`pano/ders-defteri.md`.** Mergen her turun sonunda günceller, Kayra her yeni turda okur. Kullanıcı bir fikri tartışırken neden söylerse o anda yazılır, tur sonunu beklemez. Biçim: `ders | tür | kaynak (fikir, kim) | kaç kez | yeni fikirde neyi değiştirir`.

- **Tür:** `kullanıcı` (kullanıcının "şu yüzden olmaz" dediği), `beğeni` (kullanıcının beğenme nedeni), `jüri`, `puan`, `kürsü`, `işe yarayan`.
- **`kullanıcı` dersi bağlayıcıdır.** Aynı nedene takılan yeni fikir yazılmaz; Mergen denetimde geri çevirir. Kullanıcı kaldırana kadar geçerlidir. Katılmıyorsan kullanıcıya söyle, defterden kendin silme.
- **Diğer dersler yol gösterir, veto değildir.** Kayra gözetir ama cesur fikri sulandırmaz.
- **Birikimlidir.** Önceki turların dersi silinmez; aynı ders tekrar edince sayacı artar. Yalnız final adayı değil, turdaki bütün fikirlerin Töre gerekçeleri, Kurultay soruları ve kürsü kıyası okunur.
- **Fikirde karşılığı olmayan gerekçe ders değildir.** "Yeni fikirde neyi değiştirir" sütunu yazılamıyorsa satır girmez. Fikir aşamasında hiçbir fikrin kapatamayacağı eksik (bağımsız kullanıcı, gerçek ödeme) ölçeğin sabitidir. SOON Fall 2026'da (koşu 50d9f45b) Kayra'ya her tur bu gerekçe gitti, en düşük boyutlar 12 turda hiç yükselmedi.
- **Puan yazmaz.** Defterde puan, derece ve eşik bulunmaz; Kayra sayıyı görürse Töre'nin sevdiğini yazmaya başlar.
- **Karta girmez.** Kayra hangi fikrin hangi derse cevap verdiğini `pano/huni<N>-dersler.md`'ye (geliştirmede `-gelistirme` ekiyle) yazar. Mergen denetimde okur, gerçek oturumda kullanıcıya söyler; Töre, Kurultay ve Yabancı görmez, böylece puan bağımsız kalır.

## 6. Sonraki turlar

Huni tek turda bitmek zorunda değil. Kullanıcının cevabına göre:

- Beğenilenleri **kenarda** tut, taramaya devam et.
- Bırakılanları **rafa kaldır**; silme, nedenini yaz (ve bölüm 5'i uygula).
- İstenen yönde yeni taramayı Kayra'ya yaptır; yeni fikirler de aynı sıradan geçer ve önceki turlarla aynı ölçüyle puanlanır.
- Kullanıcı bir fikrin belirli bir yanını beğendiğini söylerse (altındaki teknik, kullanıcısı, mekaniği) Kayra'yı varyant modunda çağır: o yanı sabit tutup gerisini değiştiren 3–5 varyant.
- **Geliştirme:** Yeni tur yalnız yeni alan taraması değildir: en iyi iki fikrin zayıf yanını defterdeki derslerle düzeltecek geliştirmeyi de öner (Kayra, geliştirme modu). Yönü kullanıcı seçer. Geliştirmenin yeni fikir sayılması için kullanıcı, çekirdek döngü ya da primitiften en az biri değişir (`puanlama` kural 6); ad, pitch, anlatım ya da yalnız demo kapsamı değişikliği sayılmaz.
- Kullanıcı bir fikri anlamadığını söylerse sıfırdan anlat ve açıklamayı dosyaya ayrı bölüm olarak ekle.
- Her turun sonunda bütün fikirlerin güncel sıralamasını tek tabloda ver.
- **Kalite tokenden önce gelir.** Gerçek oturumda tur sınırı yoktur ve `simulasyon` skill'indeki kısaltmalar uygulanmaz. Fikir ilk 3 için kürsüyü geçmelidir (`derin`, Kürsü kıyası); geçmiyorsa bunu açıkça söyle ve taramayı öner.

Kullanıcı "derin analize şu fikirlerle geç" diyene ya da yalnız "devam" yazana kadar huni açık kalır. "Devam" yazarsa önerdiğin fikirlerle derin analize (`derin` skill'i) geçilir.

**Durakta istenecekler:** Derin analize hangi fikirlerle gidileceği; itiraz edilen puanlar; "bu neden bu kadar aşağıda" denen fikirler; yeni tarama isteniyorsa yönü; bu turda doğan itiraz adaylarından havuza gönderilmesi istenenler.
