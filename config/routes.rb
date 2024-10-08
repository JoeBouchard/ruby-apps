Rails.application.routes.draw do
  root "entries#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "auth/:provider/callback", to: "sessions#create"

  get "login", to: redirect("/auth/openid_connect"), as: "login" if Rails.env == "production"
  get "login", to: redirect("/auth/developer"), as: "login" unless Rails.env == "production"


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  resources :entries
end
