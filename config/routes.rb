Rails.application.routes.draw do
  root to: 'lists#new'

  resources :lists do
    resources :items, module: :lists do
      resources :votes, module: :items
    end

    resources :invitations, module: :lists
  end
end
