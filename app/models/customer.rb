class Customer < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :merchants, through: :invoices

  def self.favorite_customer_by_merchant(id)
    select("customers.*", "count(customers.id) AS count")
      .joins(:invoices, :merchants)
      .where("merchants.id = ?", id)
      .group("customers.id")
      .order(count: :desc)
      .limit(1)
      .first
  end

  def self.customers_with_pending_invoices(id)
    select("customers.*")
      .joins(:invoices, :merchants, :transactions)
      .where("transactions.result = ?", "pending")
      .where("merchants.id = ?", id)
  end

end
