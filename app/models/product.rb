class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :status, :charge, :source, :day

  with_options presence: true do
    validates :name,                   length: { maximum: 40 }
    validates :product_description,    length: { maximum: 1000 }
    validates :price
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :product_category_id
      validates :product_status_id
      validates :delivery_charge_id
      validates :delivery_source_id
      validates :days_up_to_delivery_id
    end
  end

  with_options allow_blank: true do
    validates :price,                  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                                       format: { with: /\A[0-9]+\z/ }
  end
end
