Rails.application.routes.draw do
  devise_for :users
  root to: 'tours#home'
  # patch '/update_stars', to: 'bookings#update_stars'
  resources :tours do
    collection do
      get :rockefeller
    end
    resources :bookings, only: %i[new] do
      member do
        # patch :update_stars
        get :map
        get :ar_experience
      end
    end
  end
  resources :locations, only: %i[new create destroy]
end
