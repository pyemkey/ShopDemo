ShopDemo::Application.routes.draw do
  devise_for :users
  root "listings#index"
  resources :listings do
    resources :order
  end
  get '/seller', to: "users#show", as: 'seller'

end
