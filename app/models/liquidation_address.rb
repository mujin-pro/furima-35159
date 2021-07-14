class LiquidationAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :source_id, :city, :block, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is Invalid. Include hyphen(-)" }
    validates :source_id,   numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "is Invalid. Enter in 11 digits" }
    validates :token
  end

  def save
    liquidation = Liquidation.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, source_id: source_id, city: city, block: block, building_name: building_name, phone_number: phone_number, liquidation_id: liquidation.id)
  end
end
