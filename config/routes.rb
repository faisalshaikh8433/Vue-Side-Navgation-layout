Rails.application.routes.draw do
  resources :items

  namespace :api do
    namespace :v1 do
      get :dashboard, to: "dashboard#item_count"
      resources :items
    end
  end
  
  root "dashboard#index"
end
