# BA_Assessment

### Question 1
Disebutkan seorang client membutuhkan layanan aplikasi antar makanan. Dan Anda diminta untuk membuat desain sistem dengan kriteria pelanggan hanya dilayani dengan mobile apps.
```
Desainlah stack backend dan micro service layanan tersebut beserta tools dan alasan mengapa memilih design dan tools tersebut.
```
##### Answer :

###### Batasan :
- Diasumsikan bahwa server menggunakan Ubuntu OS versi terbaru, dbms mysql, dan Ruby on Rails.

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

### Question 3
Buatlah sebuah service RESTFul API berdasarkan dokumentasi apiary berikut.
https://testbinar.docs.apiary.io/. Boleh menggunakan bahasa apapun.
- Sertakan panduan cara instalasi tools, pengaturan database, penggunaan kode dan cara ujicoba kode dalam file Readme.md

###### Clone rails application
```
git clone git@github.com:ndgspn/BA_Assessment.git
cd BA_Assessment/binar_api
rake db:create
rake db:migrate
rails s
```
Aplikiasi bisa diakses melalui url http://localhost:3000

###### Test via Postman
```
# Login
# 'POST'
http://localhost:3000/auth/login

# Create User
# 'POST'
http://localhost:3000/auth/signup

# Show Data
# 'GET'
http://localhost:3000/v1/products

# Show Data by ID
# 'GET' 
http://localhost:3000/v1/products/:id

# Create Data
# 'POST'
# Raw Data Example:
# {
#    "name": "polygon xtrada x4",
#    "price": "2180",
#    "imageurl": "https://polygoneeimages.s3.amazonaws.com/images/19342/xtrada_5_p.jpg"
#}
http://localhost:3000/v1/products/

# Update Data
# PUT
# Raw Data Example:
# {
#    "name": "polygon xtrada x4",
#}
http://localhost:3000/v1/products/:id

# Delete
# 'DELETE'
http://localhost:3000/v1/products/:id

```

don't forget to add Headers `Content-Type: Application/json`

##### API V2
```
http://localhost:3000/v2/products/
```


##### Sertakan tangkapan layar proses ujicoba API menggunakan postman.
###### Auth Login
![Auth login](https://github.com/ndgspn/BA_Assessment/blob/master/images/auth_login.png)

###### Create User
![Auth signup](https://github.com/ndgspn/BA_Assessment/blob/master/images/auth_signup.png)

###### Show Data
![Show data](https://github.com/ndgspn/BA_Assessment/blob/master/images/show_all_products.png)

###### Show Data by ID
![Show data by id](https://github.com/ndgspn/BA_Assessment/blob/master/images/show_data_by_id.png)

###### Create Data
![Create data](https://github.com/ndgspn/BA_Assessment/blob/master/images/create.png)

###### Update Data
![Update data](https://github.com/ndgspn/BA_Assessment/blob/master/images/update.png)

###### Delete Data by ID
![Delete data](https://github.com/ndgspn/BA_Assessment/blob/master/images/delete.png)

###### API V2 Show Data
![Api v2](https://github.com/ndgspn/BA_Assessment/blob/master/images/products_v2.png)

### Question 4 
Dari dokumen https://testbinar.docs.apiary.io/, menurut anda, apakah ada desian API yang kurang maupun keliru? Jika ada, tuliskan kekurangan-kekurangan desain tersebut dan bagaimana seharusnya dokumentasi itu ditulis.
```
Awalnya terasa kurang jelas, tapi setelah ditelusuri cukup jelas. 
Entah mengapa di bagian API Update Product ketika dijalankan response menunjukan Data berhasil diubah, namun ketika dicek kembali data tidak berubah.
```
