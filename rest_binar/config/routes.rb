Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope 'auth' do
    post '/login', to: 'login#create'
    post '/signup', to: 'signup#create'
  end

  scope module: 'api' do
    namespace :v1 do
      resources :products
    end

    namespace :v2 do
      resources :products
    end
  end
end
