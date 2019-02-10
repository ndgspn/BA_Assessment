# README

### This appliation use JWT (Json Web Token)
```
git clone git@github.com:ndgspn/BA_Assessment.git
cd BA_Assessment/binar_api
rake db:create
rake db:migrate
rails s

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
``

# Example

```
##### Login
http://localhost:3000/auth/login

##### Create User
http://localhost:3000/auth/signup

##### Show Data
http://localhost:3000/v1/products

##### Show Data by ID
http://localhost:3000/v1/products/:id

##### Create Data
http://localhost:3000/v1/products/
```
 Raw Data Example:
 {
    "name": "polygon xtrada x4",
    "price": "2180",
    "imageurl": "https://polygoneeimages.s3.amazonaws.com/images/19342/xtrada_5_p.jpg"
}
```

##### Update Data
http://localhost:3000/v1/products/:id

##### Delete
http://localhost:3000/v1/products/:id


# API V2
http://localhost:3000/v2/products/
```
