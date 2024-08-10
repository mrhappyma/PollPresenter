Rails.application.routes.draw do
  resources :polls do
    resources :votes, only: %i[create]
    member do
      get "/vote" => "votes#new"
      get "/pie" => "votes#pie"
      get "/results" => "votes#results"
    end
  end

  get "/vote/:id" => "votes#new"
  post "/vote/:id" => "votes#create"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
