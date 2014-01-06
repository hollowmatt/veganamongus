Veganamongus::Application.routes.draw do

  authenticated :user do
    root :to => 'recipes#index', :as => "authenticated_root"
  end
  root :to => "home#index"
  get "/about" => "home#about"
  devise_for :users
  devise_for :categories
  devise_for :recipes
  resources :users
  resources :categories
  resources :recipes do
    resources :ingredients
  end
end