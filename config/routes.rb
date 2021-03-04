Rails.application.routes.draw do
  get 'settings/change'
  devise_for :users
  root to: 'pages#home'
  resources :items do
    resources :reviews, only: [:index, :new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
