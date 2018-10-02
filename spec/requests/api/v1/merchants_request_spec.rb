require 'rails_helper'

describe 'Merchants API' do
  it "sends a list of all merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)

    expect(merchants.count).to eq(3)
  end
  it "can get one merchant by id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)
    expect(merchant["id"]).to eq(id)
  end
  it "can create a new merchant" do
    merchant_params = { name: "Sue" }

    post "/api/v1/merchants", params: {merchant: merchant_params}

    merchant = Merchant.last

    assert_response :success
    expect(response).to be_successful
    expect(merchant.name).to eq(merchant_params[:name])
  end
  it "can update a merchant" do
    id = create(:merchant).id

    previous_name = Merchant.last.name
    merchant_params = { name: "NewName"}

    put "/api/v1/merchants/#{id}", params: { merchant: merchant_params}
    merchant = Merchant.find_by(id: id)

    expect(response).to be_successful
    expect(merchant.name).to eq("NewName")
    expect(merchant.name).to_not eq(previous_name)
  end
end