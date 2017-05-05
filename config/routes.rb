Rails.application.routes.draw do

  resources :regions
  post '/rate' => 'rater#create', :as => 'rate'
  resources :profile, only: [:index, :edit]
  resources :about, :only => [:index]
# point controller for omniauth to devise
  devise_for :users, controllers: { omniauth_callbacks: "callbacks"}

  resources :houses

  resources :houses do
    resources :reviews, :bookings, except: [:show]
  end

  resources :landing, only: [:index]
  root to: 'landing#index'

# make the index of houses into /discover
end
