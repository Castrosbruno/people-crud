Rails.application.routes.draw do
  resources :people
  resources :address, only: :destroy
  root 'people#index'
end
