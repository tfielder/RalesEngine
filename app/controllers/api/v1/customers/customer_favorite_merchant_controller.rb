class Api::V1::Customers::CustomerFavoriteMerchantController < ApplicationRecord
  def
    binding.pry
    render json: Merchant.joins(:invoices)
      .where("invoices.customer_id = ?", params[:customer_id])
      .select("count(merchants.id) AS count", "merchants.id")
      .group("merchants.id")
      .order(count: :desc)
      .limit(1)
  end
end