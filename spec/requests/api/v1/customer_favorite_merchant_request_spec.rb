require 'rails_helper'

describe 'Customer favorite merchant' do
  it 'sends a customers favorite merchant' do
    # create_list(:merchant, 3)
    # create_list(:customer, 2)
    # create_list(:invoice, 5)

    get '/api/v1/customers/1/favorite_merchant'

    expect(response).to be_successful
  end
end