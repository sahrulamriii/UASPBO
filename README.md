## REPOSITORY TUGAS AKHIR UAS PBO

Untuk cara kolaborasi dengan github ada di link berikut :
https://dev.to/yudhasdev/tutorial-github-3-bagaimana-cara-menggunakan-branch-dan-merge-di-github-3nj1

Silahkan bisa clone repository ini :
1. siapkan forder untuk menampung project
2. klik kalan dan pilih git bash here
3. jalankan perintah berikut :</br>
    git clone <link_repo>
4. Sebelum itu, lakukan clone repository </br>
   link repo bisa didapatkan dari tombol code pada web repo github
5. buat branch baru dengan menjalankan command : </br>
   git branch <nama_branch>
6. pindah ke branch yang sudah dibuat : </br>
   git checkout <nama_branch>
7. silahkan lakukan perubahan
8. jangan lupa import database
9. cara import database : </br>
    https://youtu.be/ZRrwZzRmpGk?si=FPSfojVlVbLfeeHi
11. lakukan commit setelah selesai </br>
   git commit -m "pesan commit"
12. lakukan push </br>
    git push origin <nama_branch>

Database terdiri dari 3 tabel yaitu :
1. Tabel fakultas </br>
   atribut tabel : </br>
   a. id_fakultas </br>
   b. fakultas
3. tabel prodi </br>
   atribut tabel : </br>
   a. id_prodi </br>
   b. prodi
5. tabel peserta </br>
   atribut tabel : </br>
   a. id_peserta </br>
   b. id_fakultas </br>
   c. id_prodi </br>
   d. nama </br>
   e. kota </br>
   f. tgl_lahir </br>
   g. alamat

## ___Setiap table berelasi dengan table lainnya___
   
   

