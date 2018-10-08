class Invoice < ApplicationRecord
  validates_presence_of :customer_id
  validates_presence_of :merchant_id
  validates_presence_of :status

  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  def self.top_items_ranked(quantity)
    Invoice.select("items.*", "count(item.id) AS count")
    .joins(:invoice_items, :transactions)
    .where("transactions.result = ?", "success")
    .group("item.id")
    .order(count: :desc)
    .limit(quantity)
  end
end
