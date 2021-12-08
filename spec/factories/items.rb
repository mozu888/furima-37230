FactoryBot.define do
  factory :item do
    item_name       {"テスト"}
    explanation     {"商品の説明"}
    category_id     {2}
    status_id       {3}
    delivery_fee_id {2}
    prefecture_id   {3}
    delivery_day_id {2}
    price           {1000}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
    association :user
  end
end
