class Api::V1::Merchants::MerchantItemController < ApplicationController
  def index
    render json: Merchant.find(params[:id]).items
  end
end