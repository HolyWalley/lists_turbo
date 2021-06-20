Rails.application.routes.draw do
  root to: 'lists#new'

  resources :lists do
    resources :items, module: :lists
  end
end
