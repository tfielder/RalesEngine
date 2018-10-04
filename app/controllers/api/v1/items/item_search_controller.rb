class Api::V1::Items::ItemSearchController < ApplicationController
  def index
    if params[:name]
      render json: Item.where(name: params[:name])
    elsif params[:description]
      render json: Item.where(description: params[:description])
    elsif params[:unit_price]
      render json: Item.where(unit_price: params[:unit_price])
    elsif params[:merchant_id]
      render json: Item.where(merchant_id: params[:merchant_id])
    elsif params[:created_at]
      render json: Item.where(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Item.where(updated_at: params[:updated_at])
    elsif params[:id]
       render json: Item.where(id: params[:id])
    end
  end

  def show
    if params[:name]
      render json: Item.find_by_name(params[:name])
    elsif params[:description]
      render json: Item.find_by_description(params[:description])
    elsif params[:unit_price]
      render json: Item.find_by_unit_price(params[:unit_price])
    elsif params[:merchant_id]
      render json: Item.find_by_merchant_id(params[:merchant_id])
    elsif params[:created_at]
      render json: Item.find_by_created_at(params[:created_at])
    elsif params[:updated_at]
      render json: Item.find_by_updated_at(params[:updated_at])
    elsif params[:id]
      render json: Item.find(params[:id])
    end
  end
end