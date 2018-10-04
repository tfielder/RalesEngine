Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'merchant_search#show'
        get '/find_all', to: 'merchant_search#index'
      end
      resources :merchants, only: [:index, :show] do
        get '/items', to: 'merchants/merchant_items#index'
        get '/invoices', to: 'merchants/merchant_invoices#index'
      end
      namespace :customers do
        get '/find', to: 'customer_search#show'
        get '/find_all', to: 'customer_search#index'
      end
      resources :customers, only: [:index, :show] do
        get '/invoices', to: 'customers/customer_invoices#index'
        get '/transactions', to: 'customers/customer_transactions#index'
      end
      resources :items, only: [:index, :show]
      namespace :invoices do
        get '/find', to: 'invoice_search#show'
        get '/find_all', to: 'invoice_search#index'
      end
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
    end
  end
end
