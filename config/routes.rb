Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  unauthenticated do
    root 'home#index', as: :unauthenticated_root
  end

  resources :categories, only: [:index, :new, :create, :edit, :update, :show, :destroy] do 
    resources :budget_logs, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy'
  end
  root to: 'home#index'
end
