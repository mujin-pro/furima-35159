class User < ApplicationRecord
  with_options presence: true do
    validates :nickname
    validates :family_name
    validates :first_name
    validates :family_name_furigana
    validates :first_name_furigana
    validates :birth_day
  end

  with_options allow_blank: true do
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :family_name_furigana
      validates :first_name_furigana
    end
    validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
