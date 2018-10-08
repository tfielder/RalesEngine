class Api::V1::Items::MostItemsController < ApplicationController
  def index
    InvoiceItem.top_items_ranked(params[:quantity])
  end
end