Rails.application.routes.draw do

  devise_for :users

  resources :events

  namespace :admin do
    root "events#index"
    resources :events do
      resources :tickets, :controller => "event_tickets"

      collection do
        post :bulk_update
      end
    end
      resources :users do
        resource :profile, :controller => "user_profiles"
      end
  end

  root "events#index"

  resource :user

  resources :categories

end
