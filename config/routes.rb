Rails.application.routes.draw do
  devise_for :users
  root to: 'profile/pets#index'
  
  namespace :users do
    resources :pets
  end


  scope module: 'profile' do
    get 'about' => 'pages#about', as: :about
    get 'pets' => 'pets#index', as: :pets
    get 'pets/:id' => 'pets#show', as: :pet
  end


end
