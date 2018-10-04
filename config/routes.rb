Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'merchant_search#show'
        get '/find_all', to: 'merchant_search#index'
      end
      resources :merchants, only: [:index, :show] do
        get '/items', to: 'merchants/merchant_items#index'
      end
      resources :items, only: [:index, :show]
      namespace :customers do
        get '/find', to: 'customer_search#show'
        get '/find_all', to: 'customer_search#index'
      end
      resources :customers, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
