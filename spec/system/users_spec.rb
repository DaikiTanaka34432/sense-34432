require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context "ユーザーが新規登録できるとき"do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      find("#user_select").find("option[value='1']").select_option
      fill_in "user[nickname]", with:"@user.nickname"
      fill_in "user[email]", with:"@user.email"
      fill_in "user[password]", with:"@user.password"
      fill_in "user[password_confirmation]", with:"@user.password_confirmation"
      fill_in "user[last_name]", with:"@user.last_name"
      fill_in "user[first_name]", with:"@user.first_name"
      fill_in "user[last_name_kana]", with:"@user.last_name_kana"
      fill_in "user[first_name_kana]", with:"@user.first_name_kana"
      find("#user_birthday_1i").find("option[value='1990']").select_option
      find("#user_birthday_2i").find("option[value='1']").select_option
      find("#user_birthday_3i").find("option[value='1']").select_option
      find("#user_office_id").find("option[value='1']").select_option
      find("#user_career_1i").find("option[value='2010']").select_option
      fill_in "user[telephone]", with:"@user.telephone"
      fill_in "user[introduction]", with:"@user.introduction"
      # 新規登録ボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find(input[name="commit"]).click
      }.to change {User.count}.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # トップページにログアウトボタンが表示されることを確認する
      expect(page).to have_content('ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('ログイン')
      expect(page).to have_no_content('新規登録')
    end
  end

  context "ユーザーが新規登録できないとき"do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      # 新規登録ページへ移動する
      # ユーザー情報を入力する
     
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      # 新規登録ページへ戻されることを確認する
      #エラーメッセージが表示されていること確認する
    end
  end
  
end
