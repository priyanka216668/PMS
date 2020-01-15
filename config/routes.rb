Rails.application.routes.draw do
  root 'projects#index'

  resources :projects do
    resources :todos, only: [:new, :create, :edit, :update]
  end
  
  get 'reports', to: "projects#reports"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
