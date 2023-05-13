Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end

  unauthenticated do
    root 'splash#index', as: :unauthenticated_root
  end


  resources :categories, only: [:index, :new, :create, :edit, :update, :show, :destroy] do 
    resources :budget_logs, only: [:new, :create, :edit, :update, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  
  devise_scope :user do
    get '/logout', to: 'devise/sessions#destroy'
  end
  
end
