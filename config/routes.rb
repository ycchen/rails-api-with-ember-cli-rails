Rails.application.routes.draw do
  
  resources :publishing_houses
  resources :authors
  resources :books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount_ember_app :frontend, to: "/"
end
