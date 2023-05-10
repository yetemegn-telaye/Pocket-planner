Rails.application.routes.draw do
  resources :categories do 
    resources :budget_logs
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy'
  end
  root to: 'home#index'
end
