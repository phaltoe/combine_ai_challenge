Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'meetings#index'
  resources :meetings, only: [:index, :show]
  resources :users, only: [:show]

end
