ShopDemo::Application.routes.draw do
  devise_for :users
  root "listings#index"
  resources :listings do
    resources :orders
  end
  resources :purchases, only: :index
  resources :sales, only: :index
  get '/seller', to: "users#show", as: 'seller'

end
