require 'rails_helper'
RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品出品できるとき' do
      it '商品画像・商品名・商品説明・商品カテゴリー・商品の状態・配送料・発送元・日数・価格の入力があれば出品できる' do
        expect(@product).to be_valid
      end

      it '価格が300~9999999の半角数字であれば登録できる' do
        @product.price = 300
        expect(@product).to be_valid
      end
    end

    context '商品出品できないとき' do
      it '画像がなければ登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end

      it '商品説明が空では登録できない' do
        @product.product_description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Product description can't be blank")
      end

      it '商品カテゴリーが「---」では登録できない' do
        @product.product_category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Product category must be other than 1')
      end

      it '商品の状態が「---」では登録できない' do
        @product.product_status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Product status must be other than 1')
      end

      it '配送料が「---」では登録できない' do
        @product.delivery_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery charge must be other than 1')
      end

      it '発送元が「---」では登録できない' do
        @product.delivery_source_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Delivery source must be other than 1')
      end

      it '日数が「---」では登録できない' do
        @product.days_up_to_delivery_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Days up to delivery must be other than 1')
      end

      it '価格が空では登録できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円未満では登録できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が9999999円以上では登録できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格が半角数字以外では登録できない' do
        @product.price = 'test'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end

      it '価格が英数字混合では登録できない' do
        @product.price = 'p300'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
