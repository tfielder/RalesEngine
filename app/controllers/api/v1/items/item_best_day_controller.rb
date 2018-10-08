class Api::V1::Items::ItemBestDayController < ApplicationController
  def show
    render json: Item.find(item_id).best_day
  end
end