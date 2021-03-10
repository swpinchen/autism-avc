Rails.application.routes.draw do
  get 'users/show'
  get 'settings/change', to: "settings#change"
  devise_for :users
  root to: 'pages#landing'
  get 'dashboard', to: 'users#dashboard', as: :dashboard
  resources :items do
    resources :reviews, only: [:index, :new, :create]
  end
  resources :users, only: [:show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
