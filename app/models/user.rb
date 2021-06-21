class User < ApplicationRecord
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, allow_blank: true
  validates :first_name, presence: true
  validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, allow_blank: true
  validates :family_name_furigana, presence: true
  validates :family_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/ }, allow_blank: true
  validates :first_name_furigana, presence: true
  validates :first_name_furigana, format: { with: /\A[ァ-ヶー－]+\z/ }, allow_blank: true
  validates :birth_day, presence: true
  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }, allow_blank: true
  validates :password_confirmation, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }, allow_blank: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
