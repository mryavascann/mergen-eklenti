# Mergen

Piri Reis Üniversitesi Blockchain Kulübü'nün hackathon ajan ekibi. Claude Code ya da Codex içinde çalışır: hackathonun kurallarını, jürisini ve geçmiş kazananlarını araştırır, fikir üretir, jüriyi simüle eder, puanlar ve sunuma hazırlar. Geçmiş hackathonlarla kör simülasyon yapıp kendi tahminlerini gerçek sonuçlarla kıyaslayarak öğrenir.

Bu depo yalnız eklentiyi ve çalışma alanı şablonunu içerir. Kulübün tecrübe havuzu, sunucu ve WhatsApp ajanı ayrı ve gizlidir. Mergen'i kullanmak için kulübün sunucusunda hesabın olmalı.

## Kurulum

Adım adım rehber: [rehber/](rehber/) klasöründeki PDF.

Kısaca:

1. Kulüp yöneticisine GitHub e-postanı ilet; seni Mergen'e ekler.
2. https://mergen-alpha.vercel.app adresine GitHub ile gir, **Kişisel anahtar** sayfasından anahtar üret.
3. Bu depoyu ZIP olarak indir, içindeki `calisma-alani` klasörünü bilgisayarına kopyala ve Claude Code'da aç. Eklenti kurulumunu kabul et; sunucu adresi ve anahtar sorulunca gir.
4. Yeni bir sohbette: **Simülasyon modunu başlat, tek koşu**.

## ChatGPT kullanıyorsan: Codex bölümü

Bu depo aynı zamanda Mergen'in Codex çalışma alanıdır (`AGENTS.md`, `.codex/`, `.agents/`). Kart havuzu, hackathon listesi, süreç ve puanlama Claude bölümüyle ortaktır; ajan talimatları, ajan dersleri ve simülasyon karnesi ayrıdır.

1. Kulüp yöneticisine GitHub e-postanı ilet, sitede **Kişisel anahtar** sayfasından anahtar üret.
2. Depoyu indir: `git clone https://github.com/mryavascann/mergen-eklenti.git mergen-codex`
3. Anahtarı ortam değişkenine yaz: Windows'ta `setx MERGEN_TOKEN "mrg_..."`, macOS'ta `~/.zshrc` dosyasına `export MERGEN_TOKEN=mrg_...`
4. Codex'i yeniden aç, `mergen-codex` klasörünü aç ve projeye güven (güvenmezsen Codex bu klasörün ayarlarını okumaz).
5. Yeni bir sohbette: **Mergen bağlantımı kontrol et**, sonra **Simülasyon modunu başlat, tek koşu**.

Ayrıntı için rehberin 7. bölümüne bak.

Bu depo ana depodan otomatik kopyalanır; buraya doğrudan değişiklik gönderilmez.
