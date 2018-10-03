class Api::V1::MerchantsController < ApplicationController
  def index
    render json: Merchant.all
  end

  def show
    if params[:id] == "find"
      if params[:name] && Merchant.find_by_name(params[:name])
        render json: Merchant.find_by_name(params[:name])
      elsif params[:created_at] && Merchant.find_by_created_at(params[:created_at])
        render json: Merchant.find_by_created_at(params[:created_at])
      elsif params[:updated_at] && Merchant.find_by_updated_at(params[:updated_at])
        render json: Merchant.find_by_updated_at(params[:updated_at])
      else
         render json: Merchant.where(request.query_string)
      end
    elsif params[:id] == "find_all"
      if params[:name]
        render json: Merchant.where(name: params[:name])
      elsif params[:created_at]
        render json: Merchant.where(created_at: params[:created_at])
      elsif params[:updated_at]
        render json: Merchant.where(updated_at: params[:updated_at])
      else
         render json: Merchant.where(request.query_string)
      end
    else
      render json: Merchant.find(params[:id])
    end
  end

  # private
  #   def merchant_params
  #     params.require(:merchant).permit(:name, :created_at, :updated_at, :find, :find_all)
  #   end
end