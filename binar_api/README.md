# README
```
git clone git@github.com:ndgspn/BA_Assessment.git
cd BA_Assessment/binar_api
rake db:create
rake db:migrate
rails s

Aplikasi bisa diakses melalui url http://localhost:3000

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


