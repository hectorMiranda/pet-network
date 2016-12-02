Rails.application.routes.draw do
  get 'about' => 'pages#about', as: :about
  

  resources :pets
  root to: 'pets#index'
end
