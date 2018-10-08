class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :invoices
  has_many :items
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def self.favorite_merchant_by_customer(id)
    joins(:invoices, :transactions)
      .where("invoices.customer_id = ?", id)
      .where("transactions.result = ?", "success")
      .select("merchants.*", "count(merchants.id) AS count")
      .group("merchants.id")
      .order(count: :desc)
      .limit(1)
      .first
  end

  def revenue(id)
    invoices.joins(:invoice_items, :transactions)
      .where('transactions.result = ?', "success")
      #.sum("invoice_items.unit_price * invoice_items.quantity")
  end

  # def revenue_for_date
  #   Merchant.
  #   #all the invoices with merchant_id for a date that
  #   #need relationship to transactions
  # end

end