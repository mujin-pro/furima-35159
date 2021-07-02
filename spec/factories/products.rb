FactoryBot.define do
  factory :product do
    name                    { 'test_name' }
    product_description     { 'test_description' }
    product_category_id     { rand(2..11) }
    product_status_id       { rand(2..7) }
    delivery_charge_id      { rand(2..3) }
    delivery_source_id      { rand(2..48) }
    days_up_to_delivery_id  { rand(2..4) }
    price                   { rand(300..9_999_999) }
    user

    after(:build) do |product|
      product.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
