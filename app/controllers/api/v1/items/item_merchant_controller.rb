class Api::V1::Items::ItemMerchantController < ApplicationController
  def show
    binding.pry
    render json: Item.find(params[:item_id]).merchant
  end
end