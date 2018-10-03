class Api::V1::Merchants::MerchantItemController < ApplicationController
  def index
    render json: Merchant.find(params[:id]).items
  end

  def show
    if params[:name]
      render json: Merchant.find_by_name(params[:name])
    elsif params[:created_at]
      render json: Merchant.find_by_created_at(params[:created_at])
    elsif params[:updated_at]
      render json: Merchant.find_by_updated_at(params[:updated_at])
    elsif params[:id]
      render json: Merchant.find(params[:id])
    end
  end
end