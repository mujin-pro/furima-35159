require 'rails_helper'

RSpec.describe LiquidationAddress, type: :model do
  before do
    product = FactoryBot.create(:product)
    @liquidation_address = FactoryBot.build(:liquidation_address, product_id: product.id, user_id: product.user_id)
    sleep 0.1
  end

  describe '商品出品機能' do
    context '商品購入できるとき' do
      it '郵便番号・都道府県・市区町村・電話番号が正しく入力され、tokenが正しく発行されていれば登録できる' do
        expect(@liquidation_address).to be_valid
      end

      it '建物名が空でも登録できる' do
        @liquidation_address.building_name = ''
        expect(@liquidation_address).to be_valid
      end
    end

    context '商品出品できないとき' do
      it '郵便番号が空では登録できない' do
        @liquidation_address.postal_code = ''
        @liquidation_address.valid?
        expect(@liquidation_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号に半角ハイフンが含まれていないと登録できない' do
        @liquidation_address.postal_code = '1234567'
        @liquidation_address.valid?
        expect(@liquidation_address.errors.full_messages).to include('Postal code is Invalid. Include hyphen(-)')
      end

      it '郵便番号が半角数字以外では登録できない' do
        @liquidation_address.postal_code = '１２３-４５６７'
        @liquidation_address.valid?
        expect(@liquidation_address.errors.full_messages).to include('Postal code is Invalid. Include hyphen(-)')
      end

      it '都道府県が「---」では登録できない' do
        @liquidation_address.source_id = '1'
        @liquidation_address.valid?
        expect(@liquidation_address.errors.full_messages).to include('Source must be other than 1')
      end

      it '市区町村が空では登録できない' do
        @liquidation_address.city = ''
        @liquidation_address.valid?
        expect(@liquidation_address.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では登録できない' do
        @liquidation_address.block = ''
        @liquidation_address.valid?
        expect(@liquidation_address.errors.full_messages).to include("Block can't be blank")
      end

      it '電話番号が空では登録できない' do
        @liquidation_address.phone_number = ''
        @liquidation_address.valid?
        expect(@liquidation_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が11桁でなければ登録できない' do
        @liquidation_address.phone_number = '0123456789'
        @liquidation_address.valid?
        expect(@liquidation_address.errors.full_messages).to include('Phone number is Invalid. Enter in 11 digits')
      end

      it '電話番号が半角数字以外では登録できない' do
        @liquidation_address.phone_number = 'abcdefghijk'
        @liquidation_address.valid?
        expect(@liquidation_address.errors.full_messages).to include('Phone number is Invalid. Enter in 11 digits')
      end

      it 'tokenが空では登録できない' do
        @liquidation_address.token = ''
        @liquidation_address.valid?
        expect(@liquidation_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐づいていないと登録できない' do
        @liquidation_address.user_id = ''
        @liquidation_address.valid?
        expect(@liquidation_address.errors.full_messages).to include("User can't be blank")
      end

      it 'productが紐づいていないと登録できない' do
        @liquidation_address.product_id = ''
        @liquidation_address.valid?
        expect(@liquidation_address.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
