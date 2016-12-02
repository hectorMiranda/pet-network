Rails.application.routes.draw do
  root to: 'profile/pets#index'
  
  namespace :user do
    resources :pets
  end


  scope module: 'profile' do
    get 'about' => 'pages#about', as: :about
    get 'pets' => 'pets#index', as: :pets
    get 'pets/:id' => 'pets#show', as: :pet
  end


end
