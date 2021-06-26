class Product < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :name,                  length: { maxium: 40 }
    validates :product_description,   length: { maxium: 1000 }
    validates :product_category_id
    validates :product_status_id
    validates :delivery_charge_id
    validates :delivery_source_id
    validates :days_up_to_delivery_id
    validates :price,                 numericality: { in: 300..9999999 }
  end

end
