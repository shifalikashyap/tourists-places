Rails.application.routes.draw do
#   get '/admin_users/sign_out', to: 'devise/sessions#destroy'
  devise_for :admin_users, controllers: {
        sessions: 'admin_users/sessions',
        passwords: 'admin_users/passwords',
        registrations: 'admin_users/registrations',
        confirmations: 'admin_users/confirmations'
      }
  root 'hoe#index'
  resources :places
  resources :likes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :hotels

  namespace :admin do
    resources :places do 
      member do 
        get :load_place_images
      end
    end
    resources :likes
    resources :hotels
  end

end
