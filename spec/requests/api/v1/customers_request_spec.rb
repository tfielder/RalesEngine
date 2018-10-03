require 'rails_helper'

describe 'Merchants API' do
  it "sends a list of all customers" do
    create_list(:customer, 3)

    get '/api/v1/customers'

    expect(response).to be_successful

    customers = JSON.parse(response.body)

    expect(customers.count).to eq(3)
  end
  it "can get one customer by id" do
    id = create(:customer).id

    get "/api/v1/customers/#{id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)
    expect(customer["id"]).to eq(id)
  end
end