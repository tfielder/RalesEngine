# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require_relative 'data/customers.csv'
require_relative 'data/invoice_items.csv'
require_relative 'data/invoices.csv'
require_relative 'data/items.csv'
require_relative 'data/merchants.csv'
require_relative 'data/transactions.csv'

require 'csv'

Rails.application.load_tasks

require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*/*_test.rb']
  t.verbose = true
end

task :default do
  Rake::Task["test"].invoke
end

task :seed_csv do
  OPTIONS = {headers: true, header_converters: :symbol}
  merchants = []
  CSV.foreach(File.join('db', 'csv', 'merchants.csv'), OPTIONS) do |merchant|
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