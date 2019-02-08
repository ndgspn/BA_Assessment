# BA_Assessment

### Question 1
Disebutkan seorang client membutuhkan layanan aplikasi antar makanan. Dan Anda diminta untuk membuat desain sistem dengan kriteria pelanggan hanya dilayani dengan mobile apps.
```
Desainlah stack backend dan micro service layanan tersebut beserta tools dan alasan mengapa memilih design dan tools tersebut.
```
##### Answer :

###### Batasan :
- Diasumsikan bahwa server menggunakan Ubuntu OS versi terbaru, dbms mysql, dan Ruby on Rails karena penjawab lebih menguasai menggunakan ketiga tools tersebut.
- Untuk melakukan deploy ke production server diasumsikan bahwa penjawab menggunakan Capistrano.

###### Desain V1
![Desain V1](https://github.com/ndgspn/BA_Assessment/blob/master/diagram/desain%20v1.png)

- Desain V1 adalah desain secara lebih sederhana dimana diasumsikan bahwa trafik hanya sedikit sehingga penggunaan sumber daya tidak mubazir/memakan banyak biaya. Kekurangan dari desain V1 ini adalah jika terjadi suatu kegagalan atau trafik tiba-tiba melonjak, maka tidak ada backup untuk menangani lonjakan tersebut.


###### Desain V2
![Desain V1](https://github.com/ndgspn/BA_Assessment/blob/master/diagram/desain_v2.png)

- Desain V2 dibuat lebih kompleks, yaitu diasumsikan bahwa aplikasi diakses oleh banyak sekali users.
- Untuk menangani request guna membagi beban, maka setiap request yang dilakukan akan di lewatkan terlebih dahulu ke loadbalancer server (proxy), misal menggunakan roundrobin pada Nginx, lalu akan diteruskan ke masing-masing webservice secara acak
- Sebagai antisipasi terjadinya kegagalan pada dbms server, maka dibuat dbms slave server sebagai salinan, sehingga jika terjadi kegagalan pada dbms master server masih ada salinan yang bisa digunakan tanpa perlu melakukan restore database secara manual


### Question 2
Bagaimana menangani keamanan dalam pengiriman data (backend dan mobile apps) pada sistem diatas.
- Menggunakan https pada setiap protokol http yang digunakan untuk pertukaran data/komunikasi dari mobile apps ke backend
- Membatasi akses dengan beberapa role, misal admin dan general_users. Admin memiliki full akses untuk melakukan berbagai hal yang berhubungan pengelolaan data, sedangkan general_users hanya diberikan akses ke fitur tertentu saja.
- Autentikasi untuk setiap users, misal fitur login/logout
- Autentikasi API, misal dengan jwt atau OAuth2
