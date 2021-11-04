Rails.application.routes.draw do
  devise_for :users
  root to: 'tours#home'
  resources :tours do
    resources :bookings, only: %i[new] do
      member do
        get :map
        get :ar_experience
      end
    end
  end
  resources :locations, only: %i[new create destroy]
end
