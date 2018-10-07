class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices

  # def favorite_customer
  #   binding.pry
  #   Customer.joins(:merchants).where('merchants.id = ?', :id).group_by(customers.name).count
  # end

  # def customers_with_pending_invoices(id)
  #   Customer.joins(:merchants).joins(:invoices).where('merchants.id = ?', id).where('invoices.status = ?', "pending")
  # end

  # def revenue(id)
  #   Merchant.select(invoice_item unit_price * quantity)where('merchants.id = ?', id).joins(:invoices).joins(:transactions).where('transactions.result = ?', "success").round(2)
  # end

  # def revenue_for_date
  #   Merchant.
  #   #all the invoices with merchant_id for a date that
  #   #need relationship to transactions
  # end

end