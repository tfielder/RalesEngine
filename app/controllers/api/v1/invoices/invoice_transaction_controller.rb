class Api::V1::Invoices::InvoiceTransactionsController < ApplicationController
  def show
    render json: Invoice.find(params[:invoice_id]).transactions
  end
end