class Api::V1::InvoiceItems::InvoiceItemSearchController < ApplicationController
  def index
    if params[:item_id]
      render json: InvoiceItem.where(item_id: params[:item_id])
    elsif params[:invoice_id]
      render json: InvoiceItem.where(invoice_id: params[:invoice_id])
    elsif params[:quantity]
      render json: InvoiceItem.where(quantity: params[:quantity])
    elsif params[:unit_price]
      render json: InvoiceItem.where(unit_price: params[:unit_price])
    elsif params[:created_at]
      render json: InvoiceItem.where(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: InvoiceItem.where(updated_at: params[:updated_at])
    elsif params[:id]
       render json: InvoiceItem.where(id: params[:id])
    end
  end

  def show
    if params[:item_id]
      render json: InvoiceItem.find_by_item_id(params[:item_id])
    elsif params[:invoice_id]
      render json: InvoiceItem.find_by_invoice_id(params[:invoice_id])
    elsif params[:quantity]
      render json: InvoiceItem.find_by_quantity(params[:quantity])
    elsif params[:unit_price]
      render json: InvoiceItem.find_by_unit_price(params[:unit_price])
    elsif params[:created_at]
      render json: InvoiceItem.find_by_created_at(params[:created_at])
    elsif params[:updated_at]
      render json: InvoiceItem.find_by_updated_at(params[:updated_at])
    elsif params[:id]
      render json: InvoiceItem.find(params[:id])
    end
  end
end