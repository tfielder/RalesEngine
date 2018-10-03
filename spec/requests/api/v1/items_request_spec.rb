require 'rails_helper'

describe 'Items API' do
  xit 'sends a list of all items' do
    create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_successful
  end
end