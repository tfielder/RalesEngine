class Api::V1::Merchants::RevenueController < ApplicationController
  def show
    render json: Merchant.find(:merchant_id).revenue
  end
end