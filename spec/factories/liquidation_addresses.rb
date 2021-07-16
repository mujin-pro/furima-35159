FactoryBot.define do
  factory :liquidation_address do
    postal_code     { '123-4567' }
    source_id       { rand(2..48) }
    city            { 'テスト市' }
    block           { '1-1' }
    building_name   { 'テストマンション' }
    phone_number    { '09012345678' }
    token           { 'tok_abcdefghijk00000000000000000' }
  end
end
