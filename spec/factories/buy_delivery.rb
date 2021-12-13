FactoryBot.define do
  factory :buy_delivery do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    municipality { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    call_number {1111111111}
    token {"tok_abcdefghijk00000000000000000"}
    user_id {1}
    item_id {1}
  end
end