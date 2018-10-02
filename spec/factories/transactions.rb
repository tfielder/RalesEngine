FactoryBot.define do
  factory :transaction do
    invoice_id { 1 }
    credit_card_number { 1 }
    credit_card_expiration_date { "2018-10-02 11:25:03" }
    result { "MyString" }
  end
end
