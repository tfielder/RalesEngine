class Api::V1::Customers::CustomerSearchController < ApplicationController
  def index
    if params[:first_name]
      render json: Customer.where(first_name: params[:first_name])
    elsif params[:last_name]
      render json: Customer.where(last_name: params[:last_name])
    elsif params[:created_at]
      render json: Customer.where(created_at: params[:created_at])
    elsif params[:updated_at]
      render json: Customer.where(updated_at: params[:updated_at])
    elsif params[:id]
       render json: Customer.where(id: params[:id])
    end
  end

  def show
    if params[:first_name]
      render json: Customer.find_by_first_name(params[:first_name])
    elsif params[:created_at]
      render json: Customer.find_by_created_at(params[:created_at])
    elsif params[:last_name]
      render json: Customer.find_by_last_name(params[:last_name])
    elsif params[:updated_at]
      render json: Customer.find_by_updated_at(params[:updated_at])
    elsif params[:id]
      render json: Customer.find(params[:id])
    end
  end
end