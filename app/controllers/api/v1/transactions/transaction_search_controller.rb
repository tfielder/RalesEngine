class Api::V1::Transactions::TransactionSearchController < ApplicationController
  def index
    if params[:invoice_id]
      render json: Transaction.where(invoice_id: params[:invoice_id])
    elsif params[:created_at]
      render json: Transaction.where(created_at: params[:created_at])
    elsif params[:credit_card_number]
      render json: Transaction.where(credit_card_number: params[:credit_card_number])
    elsif params[:result]
      render json: Transaction.where(result: params[:result])
    elsif params[:updated_at]
      render json: Transaction.where(updated_at: params[:updated_at])
    elsif params[:id]
       render json: Transaction.where(id: params[:id])
    end
  end

  def show
    if params[:invoice_id]
      render json: Transaction.find_by_invoice_id(params[:invoice_id])
    elsif params[:created_at]
      render json: Transaction.find_by_created_at(params[:created_at])
    elsif params[:credit_card_number]
      render json: Transaction.find_by_credit_card_number(params[:credit_card_number])
    elsif params[:result]
      render json: Transaction.find_by_result(params[:result])
    elsif params[:updated_at]
      render json: Transaction.find_by_updated_at(params[:updated_at])
    elsif params[:id]
      render json: Transaction.find(params[:id])
    end
  end
end