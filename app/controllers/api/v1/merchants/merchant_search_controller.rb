class Api::V1::Merchants::MerchantSearchController < ApplicationController
  def index
    if params[:name]
      render json: Merchant.where(name: params[:name])
    elsif params[:created_at]
      render json: Merchant.where(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Merchant.where(updated_at: params[:updated_at])
    elsif params[:id]
       render json: Merchant.where(id: params[:id])
    end
  end

  def show
    if params[:name] #&& Merchant.find_by_name(params[:name])
      render json: Merchant.find_by_name(params[:name])
    elsif params[:created_at] #&& Merchant.find_by_created_at(params[:created_at])
      render json: Merchant.find_by_created_at(params[:created_at])
    elsif params[:updated_at] #&& Merchant.find_by_updated_at(params[:updated_at])
      render json: Merchant.find_by_updated_at(params[:updated_at])
    elsif params[:id]
      render json: Merchant.find(params[:id])
    end
  end
end