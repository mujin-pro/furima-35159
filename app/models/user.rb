class User < ApplicationRecord
  validates :nickname, presence: true
  validates :family_name, presence: true, format:{with: (/\A[ぁ-んァ-ヶ一-龥々ー]+\z/)}
  validates :first_name, presence: true, format:{with: (/\A[ぁ-んァ-ヶ一-龥々ー]+\z/)}
  validates :family_name_furigana, presence: true, format:{with: (/\A[ァ-ヶー－]+\z/)}
  validates :first_name_furigana, presence: true, format:{with: (/\A[ァ-ヶー－]+\z/)}
  validates :birth_day, presence: true
  validates :password, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}
  validates :password_confirmation, format:{with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
