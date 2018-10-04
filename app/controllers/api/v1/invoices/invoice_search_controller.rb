class Api::V1::Invoices::InvoiceSearchController < ApplicationController
  def index
    if params[:customer_id]
      render json: Invoice.where(customer_id: params[:customer_id])
    elsif params[:merchant_id]
      render json: Invoice.where(merchant_id: params[:merchant_id])
    elsif params[:status]
      render json: Invoice.where(status: params[:status])
    elsif params[:created_at]
      render json: Invoice.where(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Invoice.where(updated_at: params[:updated_at])
    elsif params[:id]
      render json: Invoice.where(id: params[:id])
    end
  end

  def show
    if params[:customer_id]
      render json: Invoice.find_by_customer_id(params[:customer_id])
    elsif params[:merchant_id]
      render json: Invoice.find_by_merchant_id(params[:merchant_id])
    elsif params[:status]
      render json: Invoice.find_by_status(params[:status])
    elsif params[:created_at]
      render json: Invoice.find_by_created_at(params[:created_at])
    elsif params[:updated_at]
      render json: Invoice.find_by_updated_at(params[:updated_at])
    elsif params[:id]
      render json: Invoice.find(params[:id])
    end
  end
end