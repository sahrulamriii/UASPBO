## REPOSITORY TUGAS AKHIR UAS PBO

Untuk cara kolaborasi dengan github ada di link berikut :
https://dev.to/yudhasdev/tutorial-github-3-bagaimana-cara-menggunakan-branch-dan-merge-di-github-3nj1

Silahkan bisa clone repository ini :
1. siapkan forder untuk menampung project
2. klik kalan dan pilih git bash here
3. jalankan perintah berikut :
    git clone <link repo>
4. Sebelum itu, lakukan clone repository
   link repo bisa didapatkan dari tombol code pada web repo github
5. buat branch baru dengan menjalankan command :
   git branch <nama branch>
6. pindah ke branch yang sudah dibuat :
   git checkout <nama branch>
7. silahkan lakukan perubahan
8. jangan lupa import database
9. cara import database :
    https://youtu.be/ZRrwZzRmpGk?si=FPSfojVlVbLfeeHi
11. lakukan commit setelah selesai
   git commit -m "pesan commit"
12. lakukan push
    git push origin <nama branch>

Database terdiri dari 3 tabel yaitu :
1. Tabel fakultas
   atribut tabel :
   a. id_fakultas
   b. fakultas
3. tabel prodi
   a. id_prodi
   b. prodi
5. tabel peserta
   a. id_peserta
   b. id_fakultas
   c. id_prodi
   d. nama
   e. kota
   f. tgl_lahir
   g. alamat

## ___Setiap table berelasi dengan table lainnya___
   
   

