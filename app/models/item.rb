class Item < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price
  validates_presence_of :merchant_id

  belongs_to :merchant
  has_many :invoice_items


  def best_day
    #item that had most successful transactions by date
    #connect item to invoice items to invoices that
  end


end
