class Api::V1::InvoiceItemItems::InvoiceItemsController < ApplicationController
  def show
    binding.pry
    render json: InvoiceItem.find(params[:id]).item
  end
end