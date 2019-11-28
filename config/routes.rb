Rails.application.routes.draw do
  root to: 'home#index'
  resources :manufacturer
  resources :subsidiaries
  resources :carcategories
end
