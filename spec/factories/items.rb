FactoryBot.define do
  factory :item do
    
    association :user


    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    name {"商品名"}
    description {"商品の説明"}
    category_id {2}
    status_id {2}
    carriage_id {2}
    prefecture_id {2}
    days_to_ship_id {2}
    price {300}
  end
end
