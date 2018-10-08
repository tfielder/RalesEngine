class Api::V1::Customers::CustomerFavoriteMerchantController < ApplicationController
  def show
    id = params[:customer_id]
    render json: Merchant.favorite_merchant_by_customer(id)
  end
end