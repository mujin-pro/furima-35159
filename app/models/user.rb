class User < ApplicationRecord
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_furigana, presence: true
  validates :first_name_furigana, presence: true
  validates :birth_day, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
