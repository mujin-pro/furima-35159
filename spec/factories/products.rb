FactoryBot.define do
  factory :product do
    name            { 'test_name' }
    description     { 'test_description' }
    category_id     { rand(2..11) }
    status_id       { rand(2..7) }
    charge_id       { rand(2..3) }
    source_id       { rand(2..48) }
    day_id          { rand(2..4) }
    price           { rand(300..9_999_999) }
    user

    after(:build) do |product|
      product.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
