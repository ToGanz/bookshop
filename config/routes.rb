Rails.application.routes.draw do
  resources :line_items
  resources :orders
  resources :books
  resources :authors
  get 'static_pages/home'
  root 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
