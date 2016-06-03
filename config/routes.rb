Rails.application.routes.draw do
  resources :emergencies
  resources :responders

  root 'responders#index'
end
