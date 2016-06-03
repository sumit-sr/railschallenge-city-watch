Rails.application.routes.draw do
  resources :emergencies do
    collection do
      get 'responders'
    end
  end
  resources :responders

  root 'responders#index'
end
