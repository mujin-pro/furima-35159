class Liquidation < ApplicationRecord
  belongs_to :user
  belongs_to :product
  # attr_accessor :token

  # validates :token, presence: true
end
