Veganamongus::Application.routes.draw do

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  devise_for :categories
  devise_for :recipes
  resources :users
  resources :categories
  resources :recipes do
    resources :ingredients
  end
end