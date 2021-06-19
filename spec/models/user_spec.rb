require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'ニックネーム・パスワード・パスワード（確認用）・名字・名前・名字（カナ）・名前（カナ）・誕生日があれば登録できる' do
        expect(@user).to be_valid
      end
  
      it 'パスワードとパスワード（確認用）が6文字以上であれば登録できる' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailに@を含まない場合は登録できない' do
        @user.email = 'test.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it '同じemailが登録済みの場合は登録できない' do
        @user.save
        @user2 = FactoryBot.build(:user)
        @user2.email = @user.email
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordは英数字混合でないと登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'family_nameが空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'family_nameが全角かな/カナ/漢字以外では登録できない' do
        @user.family_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end


      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが全角かな/カナ/漢字以外では登録できない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'family_name_furiganaが空では登録できない' do
        @user.family_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name furigana can't be blank")
      end

      it 'family_name_furiganaが全角カナ以外では登録できない' do
        @user.family_name_furigana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name furigana is invalid")
      end

      it 'first_name_furiganaが空では登録できない' do
        @user.first_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank")
      end

      it 'first_name_furiganaが全角カナ以外では登録できない' do
        @user.first_name_furigana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana is invalid")
      end

      it 'birth_dayが空では登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

      it '同じメールアドレスが登録済みの場合は登録できない' do
        #同じメールアドレスを2つ登録して、登録できないことを確認する
      end

      it 'メールアドレスに@を含まない場合は登録できない' do
        #@を含まない場合は登録できないことを確認する
      end
    end
  end
end
