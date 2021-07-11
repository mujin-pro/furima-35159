class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :Liquidation

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :charge
  belongs_to :source
  belongs_to :day

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price
    validates :image
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :charge_id
      validates :source_id
      validates :day_id
    end
  end

  with_options allow_blank: true do
    validates :price,                  numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                                       format: { with: /\A[0-9]+\z/ }
  end
end
