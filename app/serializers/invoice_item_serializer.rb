class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :item_id, :quantity, :unit_price, :invoice_id

end