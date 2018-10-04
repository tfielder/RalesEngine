require 'csv'
OPTIONS = {headers: true, header_converters: :symbol}

namespace :seed_data do
  desc "Imports data from a csv file"
  task :import => :environment do
    build_merchants
    build_customers
    build_items
    build_invoices
    build_invoice_items
    build_transactions
  end
end

# def csv_parser(category)
#   array = []
#   CSV.foreach("./data/#{category}s", OPTIONS) do |row|
#     array << row
#   end
#   count = 0
#   array.each do |value|
#     hash = { if value[:id] then id: value[:id],
#              name: value[:name],
#              first_name: customer[:first_name],
#              last_name: customer[:last_name],
#              created_at: merchant[:created_at],
#              updated_at: merchant[:updated_at]
#            }
#
#   end
# end

def build_merchants
  puts "creating merchants, please wait"
  merchants = []
  CSV.foreach('./data/merchants.csv', OPTIONS) do |merchant|
    merchants << merchant
  end
  count = 0
  merchants.each do |merchant|
    merchant_hash = {id: merchant[:id],
                     name: merchant[:name],
                     created_at: merchant[:created_at],
                     updated_at: merchant[:updated_at]
                    }
    merchant = Merchant.create!(merchant_hash)
    if merchant
      count += 1;
    end
  end
  puts "Created #{count} #{"merchant"}s"
end

def build_customers
  puts "creating customers, please wait"
  customers = []
  CSV.foreach('./data/customers.csv', OPTIONS) do |customer|
    customers << customer
  end
  count = 0
  customers.each do |customer|
    customer_hash = {id: customer[:id],
                     first_name: customer[:first_name],
                     last_name: customer[:last_name],
                     created_at: customer[:created_at],
                     updated_at: customer[:updated_at]
                    }
    customer = Customer.create!(customer_hash)
    if customer
      count += 1;
    end
  end
  puts "Created #{count} #{"customer"}s"
end

def build_invoice_items
  puts "creating invoice items, please wait"
  invoice_items = []
  CSV.foreach('./data/invoice_items.csv', OPTIONS) do |invoice_item|
    invoice_items << invoice_item
  end
  count = 0
  invoice_items.each do |invoice_item|
    invoice_item_hash = {id: invoice_item[:id],
                     item_id: invoice_item[:item_id],
                     invoice_id: invoice_item[:invoice_id],
                     quantity: invoice_item[:quantity],
                     unit_price: ('%0.2f' % (item[:unit_price].to_f / 100)).to_s,
                     created_at: invoice_item[:created_at],
                     updated_at: invoice_item[:updated_at]
                    }
    invoice_item = InvoiceItem.create!(invoice_item_hash)
    if invoice_item
      count += 1;
    end
  end
  puts "Created #{count} invoice_items"
end

def build_invoices
  puts "creating invoices, please wait"
  invoices = []
  CSV.foreach('./data/invoices.csv', OPTIONS) do |invoice|
    invoices << invoice
  end
  count = 0
  invoices.each do |invoice|
    invoice_hash = {id: invoice[:id],
                     customer_id: invoice[:customer_id],
                     merchant_id: invoice[:merchant_id],
                     status: invoice[:status],
                     created_at: invoice[:created_at],
                     updated_at: invoice[:updated_at]
                    }
    invoice = Invoice.create!(invoice_hash)
    if invoice
      count += 1;
    end
  end
  puts "Created #{count} invoices"
end

def build_items
  puts "creating items, please wait"
  items = []
  CSV.foreach('./data/items.csv', OPTIONS) do |item|
    items << item
  end
  count = 0
  items.each do |item|
    item_hash = {id: item[:id],
                 name: item[:name],
                 description: item[:description],
                 unit_price: ('%0.2f' % (item[:unit_price].to_f / 100)).to_s,
                 merchant_id: item[:merchant_id],
                 created_at: item[:created_at],
                 updated_at: item[:updated_at]
                }
    item = Item.create!(item_hash)
    if item
      count += 1;
    end
  end
  puts "Created #{count} items"
end

def build_transactions
  puts "creating transactions, please wait"
  transactions = []
  CSV.foreach('./data/transactions.csv', OPTIONS) do |transaction|
    transactions << transaction
  end
  count = 0
  transactions.each do |transaction|
    transaction_hash = {id: transaction[:id],
                     invoice_id: transaction[:invoice_id],
                     credit_card_number: transaction[:credit_card_number],
                     #credit_card_expiration_date: transaction[:credit_card_expiration_date],
                     result: transaction[:result],
                     created_at: transaction[:created_at],
                     updated_at: transaction[:updated_at]
                    }
    transaction = Transaction.create!(transaction_hash)
    if transaction
      count += 1;
    end
  end
  puts "Created #{count} transactions"
end
