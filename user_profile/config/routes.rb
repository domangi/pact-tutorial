Rails.application.routes.draw do
  resources :users, only: %i[show]
end
