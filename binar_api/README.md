# README

### This application use RoR, JWT (Json Web Token) & sqlite3 .
```
# git clone git@github.com:ndgspn/BA_Assessment.git
# cd BA_Assessment/binar_api
# bundle install
# rake db:create
# rake db:migrate
# rails s

Application url http://localhost:3000

```

# Routes
```
Prefix Verb   URI Pattern                                                                              Controller#Action
               auth_login POST   /auth/login(.:format)                                                                    authentication#create
              auth_signup POST   /auth/signup(.:format)                                                                   users#create
              v1_products GET    /v1/products(.:format)                                                                   api/v1/products#index
                          POST   /v1/products(.:format)                                                                   api/v1/products#create
               v1_product GET    /v1/products/:id(.:format)                                                               api/v1/products#show
                          PATCH  /v1/products/:id(.:format)                                                               api/v1/products#update
                          PUT    /v1/products/:id(.:format)                                                               api/v1/products#update
                          DELETE /v1/products/:id(.:format)                                                               api/v1/products#destroy
              v2_products GET    /v2/products(.:format)                                                                   api/v2/products#index
```

# URL

##### Create User
```
URI: http://localhost:3000/auth/signup
Method: POST
Headers: application/json
Body:

{
	"name": "ranger",
	"email": "ranger@hitam.com",
	"password": "passwordcom"
}
```
##### Login
```
URI: http://localhost:3000/auth/login
Method: POST
Headers: application/json
Body:

{
	"email": "ranger@hitam.com",
	"password": "passwordcom"
}


# Response:

{
    "status": "OK",
    "result": {
        "access_token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo4LCJleHAiOjE1NDk4NjQ5NTF9.cjq5ADh2J-MUOzSGSVTqd6ss8WAcA5Lrru-tDGcPIyg"
    },
    "errors": []
}

```

##### Show Data
```
URI: http://localhost:3000/v1/products
Method: GET
Headers:
- Authorization token
- application/json


# Response:

{
    "status": "OK",
    "result": [
        {
            "id": 2,
            "name": "polygon xtrada x6",
            "price": "800000",
            "imageurl": "https://polygoneeimages.s3.amazonaws.com/images/19342/xtrada_5_p.jpg",
            "created_at": "2019-02-10T03:29:13.172Z",
            "updated_at": "2019-02-10T03:38:03.159Z"
        }
    ]
}
```

##### Show Data by ID
```
URI: http://localhost:3000/v1/products/:id
Method: GET
Headers:
- Authorization token
- application/json

# Response:

{
    "status": "OK",
    "result": {
        "id": 1,
        "name": "Giant Reign",
        "price": "2560",
        "imageurl": "http://www.sepedacycleshop.com/image-product/img2033-1368243649.jpg",
        "created_at": "2019-02-10T02:32:12.721Z",
        "updated_at": "2019-02-10T02:32:12.721Z"
    }
}
```


##### Create Data
```
URI: http://localhost:3000/v1/products
Method: POST
Headers:
- Authorization token
- application/json

Body:

{
    "name": "Brompton folding bike",
    "price": "2180",
    "imageurl": "https://polygoneeimages.s3.amazonaws.com/images/19342/xtrada_5_p.jpg"
}

# Response:

{
    "status": "OK",
    "result": {
        "id": 4,
        "name": "Brompton folding bike",
        "price": "2180",
        "imageurl": "https://polygoneeimages.s3.amazonaws.com/images/19342/xtrada_5_p.jpg",
        "created_at": "2019-02-10T06:17:44.228Z",
        "updated_at": "2019-02-10T06:17:44.228Z"
    }
}
```

##### Update Data
```
URI: http://localhost:3000/v1/products/:id
Method: PUT
Headers:
- Authorization token
- application/json

Body:

{
    "name": "United Folding bike",
    "price": "7000000",
    "imageurl": "https://polygoneeimages.s3.amazonaws.com/images/19342/xtrada_5_p.jpg"
}

# Response:

{
    "status": "OK",
    "result": {
        "id": 4,
        "name": "United Folding bike",
        "price": "7000000",
        "imageurl": "https://polygoneeimages.s3.amazonaws.com/images/19342/xtrada_5_p.jpg",
        "created_at": "2019-02-10T06:17:44.228Z",
        "updated_at": "2019-02-10T06:19:31.417Z"
    }
}
```

##### Delete
```
URI: http://localhost:3000/v1/products/:id
Method: DELETE
Headers:
- Authorization token

# Response:

{
    "status": "OK",
    "result": {
        "message": "product with id: 4 successfully deleted"
    }
}
```


# API V2
```
URI: http://localhost:3000/v2/products/
Method: GET
Headers:
- Authorization token

# Response:

{
    "message": "Hello there :)"
}
```
