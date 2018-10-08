class Api::V1::Items::MostItemsController < ApplicationController
  def index
    binding.pry
    Item.top_items_ranked(params[:quantity])
  end
end