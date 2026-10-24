# Mergen çalışma alanı

Bu klasörü bilgisayarında istediğin bir yere kopyala (örneğin `Belgeler/Mergen`) ve Claude Code'u bu klasörde aç. Burada açılan her sohbette Mergen yönetici olarak karşılar; komut yazmana gerek yok.

1. Klasörü kopyala ve Claude Code'da aç. "Bu klasöre güveniyor musun?" sorusuna evet de; Claude Code kulübün eklentisini kurmayı önerir. Önermezse:

   ```
   /plugin marketplace add mryavascann/mergen-eklenti
   /plugin install mergen@mergen-marketplace
   ```

2. Kurulumda sorulan sunucu adresini ve dashboard'daki **Anahtar** sayfasından aldığın kişisel anahtarı gir.
3. Model olarak Opus önerilir.

Hackathon oturumların bu klasörün içindeki `mergen/` altında birikir.

**Kullanım sayacı:** eklenti (0.2.0 ve sonrası), Mergen ajanlarının bu klasördeki oturumlarda harcadığı token sayılarını kulüp sunucusuna gönderir; dashboard'daki **Maliyet** sayfası "API'de olsaydı ne tutardı" hesabını bundan yapar. Gönderilen yalnız ajan adı, model, mesaj kimliği, zaman ve sayılardır; konuşma, dosya ya da komut gönderilmez. Mergen dışındaki işlerin sayılmaz. Kapatmak için `~/.claude/settings.json` içinde `"env": { "MERGEN_KULLANIM": "0" }` yaz. Windows'ta Git for Windows kurulu değilse sayaç PowerShell ile çalışır.
