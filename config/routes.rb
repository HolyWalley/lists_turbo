Rails.application.routes.draw do
  root to: 'lists#new'

  resources :lists do
    resources :items, module: :lists do
      resources :votes, module: :items
    end
  end
end
