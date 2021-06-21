require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができ、トップページに戻る' do
      #トップページに移動する
      visit root_path
      #トップページのヘッダーにサインアップページへの遷移ボタンがある（ログアウト状態時）
      expect(page).to have_content('新規登録')
      #新規登録ボタンを押すとサインアップページへ遷移できる
      #ユーザー情報を入力する
      fill_in('ニックネーム') with: @user.nickname
      fill_in('メールアドレス') with: @user.email
      fill_in('パスワード') with: @user.password
      fill_in('パスワード（確認）') with: @user.password_confirmation
      fill_in('お名前（全角）') with: @user.family_name
      fill_in(user[first_name]) with: @user.first_name
      #サインアップボタンを押すと、ユーザーモデルのカウントが1上がる
      expect{ 
        find('input[name = "commit"]').click 
      }.to change { User.count }.by(1)
      #トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      #ヘッダーにサインアップページへ遷移するボタン/ログインページへ遷移するボタンがなく、ユーザーのニックネーム/ログアウトボタンがある
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
      expect(page).to have_content(@user.nickname)
      expect(page).to have_content('ログアウト')
    end

    it 'ログアウトボタンを押すとログアウトし、トップページに戻る' do
      #トップページに移動する
      visit root_path
      #トップページのヘッダーにサインアップページへの遷移ボタンがある（ログアウト状態時）
      expect(page).to have_content('新規登録')
      #新規登録ボタンを押すとサインアップページへ遷移できる
      
      #サインアップページへ移動する

      #ユーザー情報を入力する
      fill_in('ニックネーム') with: @user.nickname
      fill_in('メールアドレス') with: @user.email
      fill_in('パスワード') with: @user.password
      fill_in('パスワード（確認）') with: @user.password_confirmation
      fill_in('お名前（全角）') with: @user.family_name
      fill_in(user[first_name]) with: @user.first_name
      
      #サインアップボタンを押すと、ユーザーモデルのカウントが1上がる
      expect{ 
        find('input[name = "commit"]').click 
      }.to change { User.count }.by(1)
      #トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      #ヘッダーにサインアップページへ遷移するボタン/ログインページへ遷移するボタンがなく、ユーザーのニックネーム/ログアウトボタンがある
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
      expect(page).to have_content(@user.nickname)
      expect(page).to have_content('ログアウト')
      #ログアウトボタンを押すと、トップページに遷移したことを確認する

      #ヘッダーにサインアップページへ遷移するボタン/ログインページへ遷移するボタンがあり、ユーザーのニックネーム/ログアウトボタンがない
    end

    it '正しい情報を入力すればログインができ、トップページに戻る' do
      #トップページに移動する
      #トップページのヘッダーにログインページへの遷移ボタンがある（ログアウト状態時）
      #ログインボタンを押すとサインインページへ遷移できる
      #サインインページへ移動する
      #ユーザー情報を入力する
      #サインインボタンを押すと、トップページに遷移する
      #ヘッダーにサインアップページへ遷移するボタン/ログインページへ遷移するボタンがなく、ユーザーのニックネーム/ログアウトボタンがある
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報入力ではユーザー新規登録ができず、サインアップページに戻ってくる' do
      #トップページへ遷移する
      #トップページに、サインアップページに遷移するボタンがある
      #サインアップページに遷移する
      #誤ったユーザー情報を入力する
      #サインアップボタンを押しても、ユーザーモデルのカウントが上がらない
      #サインアップページに戻される
    end
  end
end
