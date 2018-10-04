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
        get '/favorite_customer', to: 'merchants/favorite_customer#show'
        get '/customers_with_pending_invoices', to: 'merchants/pending_invoices#index'
        get '/revenue', to: 'merchants/revenue#show'
      end
      namespace :customers do
        get '/find', to: 'customer_search#show'
        get '/find_all', to: 'customer_search#index'
      end
      resources :customers, only: [:index, :show] do
        get '/invoices', to: 'customers/customer_invoices#index'
        get '/transactions', to: 'customers/customer_transactions#index'
      end
      namespace :items do
        get '/find', to: 'item_search#show'
        get '/find_all', to: 'item_search#index'
      end
      resources :items, only: [:index, :show] do
        get '/invoice_items', to: 'items/item_invoice_items#index'
        get '/merchant', to: 'items/item_merchant#show'
      end
      namespace :invoices do
        get '/find', to: 'invoice_search#show'
        get '/find_all', to: 'invoice_search#index'
      end
      resources :invoices, only: [:index, :show] do
        get '/transactions', to: 'invoices/invoice_transactions#index'
        get '/items', to: 'invoices/invoice_items#index'
        get '/invoice_items', to: 'invoices/invoice_invoice_items#index'
        get '/customer', to: 'invoices/invoice_customer#show'
        get '/merchant', to: 'invoices/invoice_merchant#show'
      end
      namespace :invoice_items do
        get '/find', to: 'invoice_items_search#show'
        get '/find_all', to: 'invoice_items_search#index'
      end
      resources :invoice_items, only: [:index, :show] do
        get '/item', to: 'invoice_items/invoice_item_item#show'
        get '/invoice', to: 'invoice_items/invoice_item_invoice#show'
      end
      namespace :transactions do
        get '/find', to: 'transaction_search#show'
        get '/find_all', to: 'transaction_search#index'
      end
      resources :transactions, only: [:index, :show] do
        get '/invoice', to: 'transactions/transaction_invoice#show'
      end
    end
  end
end
