# Fix Print Sharing Windows 11


## Deskripsi
File/tools ini berfungsi untuk mengatasi masalah terkait dengan printer sharing menggunakan jaringan pada windows 11. Contoh kode error :
- **0x0000011b**
- **0x00000709**

## Isi File/Tools
- <a href="https://www.microsoft.com/en-us/download/details.aspx?id=55319">LGPO.exe</a> merupakan utilitas baris perintah baru untuk mengotomatiskan pada local group policy
- <a href="https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/regini">regini.exe</a> memodifikasi registry dari baris perintah, dan menerapkan perubahan yang telah diatur sebelumnya dalam file text.
- Nganu.bat sebuah script dan tweak untuk fix print sharing win 11

## Cara Pakai
- Jalankan file "Nganu.bat" dengan Run as Administrator
- Atau bisa menggunakan cara manual pada "Dokumen Win 11 print sharimg.txt" (Jika masih error silahkan gunakan yg file .bat) 
## Fitur
- Setting RPC pada Group Policy dan Regedit
- Setting Point and Print
- Setting salin file pada Group Policy
- Setting PasswordLess
- Setting SMB(Server Message Block)
- Enable fitur LPD dan LPR
- Restart otomatis pada print spooler

## Lain-lain
Untuk mengetahui fungsi lebih lanjut, anda bisa membaca dokumentasi pada file yg bernama "Dokumen Win 11 print sharimg.txt"

## Credit
Special thanks to :
- iiS4w for file .bat
- enyongapangerti for Regedit tweak
