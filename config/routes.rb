Rails.application.routes.draw do
  # resources :books
  # resources :reports
  resources :reports do
    resources :comments
  end

  resources :books do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "books#index"
end
