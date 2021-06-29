class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :charge, :source, :day

  with_options presence: true do
    validates :name,                   length: { maximum: 40 }
    validates :product_description,    length: { maximum: 1000 }
    validates :product_category_id,    numericality: { other_than: 1 }
    validates :product_status_id,      numericality: { other_than: 1 }
    validates :delivery_charge_id,     numericality: { other_than: 1 }
    validates :delivery_source_id,     numericality: { other_than: 1 }
    validates :days_up_to_delivery_id, numericality: { other_than: 1 }
    validates :price,                  numericality: { in: 300..9999999 }
  end

end
