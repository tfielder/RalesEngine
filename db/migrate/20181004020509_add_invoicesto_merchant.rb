class AddInvoicestoMerchant < ActiveRecord::Migration[5.1]
  def change
    add_reference :merchants, :invoice, foreign_key: true
  end
end
