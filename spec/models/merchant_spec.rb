require 'rails_helper'

describe Merchant, type: :model do
  describe 'validations' do
    it {should validates_presence_of :name}
  end
end