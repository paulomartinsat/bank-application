Rails.application.routes.draw do
  get 'stocks/index'
  get 'wallet/index'
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources  :transactions, only: [:new, :create] do
    collection do
      get 'new_request', to: "transactions#new_request", as: :new_request
      post 'create_request', to: "transactions#create_request", as: :create_request
      get 'new_transfer', to: "transactions#new_transfer", as: :new_transfer
      post 'create_transfer', to: "transactions#create_transfer", as: :create_transfer
    end

  end

  post 'research_stock', to: "stocks#research_stock", as: :research_stock
  get 'show_stocks', to: "stocks#show", as: :show
  get 'user_list', to:"home#user_list", as: :user_list
end
