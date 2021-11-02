Rails.application.routes.draw do
  devise_for :users
  root to: 'tours#home'
  resources :tours do
    resources :locations, only: %i[new create destroy]
    resources :bookings, only: %i[new create destroy]
  end
end
