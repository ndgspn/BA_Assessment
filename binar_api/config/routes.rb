Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#create'
  post 'auth/signup', to: 'users#create'

  scope module: 'api' do
    namespace :v1 do
      resources :products
    end
    namespace :v2 do
      resources :products
    end
  end
end
