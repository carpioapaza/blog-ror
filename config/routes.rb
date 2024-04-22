Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :articles
  get "articles/user/:user_id", to: "articles#from_author"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
