require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    before do
      @user = FactoryBot.build(:user)
    end

    # ユーザー新規登録できるとき
    it 'user_check_id/nickname/mail/password/password_confirmation/last_name/first_name/last_name_kana/first_name_kana/birthday/telephone/
        が存在すれば登録できること' do
      expect(@user).to be_valid
      end 

    it 'ユーザー本名は名字が存在し、全角（漢字・ひらがな・カタカナ）で入力すれば登録できる'do
    @user.first_name ='山田'
    expect(@user).to be_valid
    end

    it 'ユーザー本名は名前が存在し、全角（漢字・ひらがな・カタカナ）で入力すれば登録できる' do
      @user.first_name ='はなこ'
      expect(@user).to be_valid
    end

    it 'ユーザー本名のフリガナは名字が存在し、全角（カタカナ）で入力すれば登録できる' do
      @user.last_name_kana ='ヤマダ'
      expect(@user).to be_valid
    end

    it 'ユーザー本名のフリガナは名前が存在し、全角（カタカナ）で入力すれば登録できる' do
      @user.first_name_kana ='ハナコ'
      expect(@user).to be_valid
    end

    it ' 生年月日が存在すれば登録できる' do
      @user.birthday ='2000-01-01'
      expect(@user).to be_valid
    end

    it ' 電話番号が存在すれば登録できる' do
      @user.telephone = '09012345678'
      expect(@user).to be_valid
    end

    it ' 電話番号が11桁の半角数字であれば登録できる' do
      @user.telephone = '09012345678'
      expect(@user).to be_valid
    end
    

    # ユーザー新規登録できない時
    it 'user_check_idが[0]だと登録できない' do
      @user.user_check_id = 0
      @user.valid?
      expect(@user.errors.full_messages).to include("User check can't be blank")
    end 
    
    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end 
    
    it 'emailが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    
    it '重複したemailが存在すると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email:@user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
      
    end
    
    it 'passwordが空だと登録できない' do
      @user.password = nil
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    
    it 'passwordが英語のみだと登録できない' do
      @user.password ='abcdef'
      @user.password_confirmation ='abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は英・数字の両方を含めて設定して下さい")
    end
    
    it 'passwordが数字のみだと登録できない' do
      @user.password ='123456'
      @user.password_confirmation ='123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は英・数字の両方を含めて設定して下さい")
    end
    
    it 'passwordが全角だと登録できない' do
      @user.password ='あいうえおか'
      @user.password_confirmation ='あいうえおか'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password は英・数字の両方を含めて設定して下さい")
    end
    
    it 'passwordが５文字以下だと登録できない' do
      @user.password ='abc12'
      @user.password_confirmation ='abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'abc123'
      @user.password_confirmation ='abc1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'last_nameが空だと登録できない' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    
    it 'last_nameが全角（漢字・ひらがな・カタカナ）以外だと登録できない' do
      @user.last_name = "山田1"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用して下さい")
    end
    
    it 'first_nameが空だと登録できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    
    it 'first_nameが全角（漢字・ひらがな・カタカナ）以外だと登録できない' do
      @user.first_name = "花子1"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用して下さい")
    end
    
    it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    
    it 'last_name_kanaが全角（カタカナ）以外だと登録できない' do
      @user.last_name_kana = "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana 全角カナ文字を使用して下さい")
    end
    
    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    
    it 'first_name_kanaが全角（カタカナ）以外だと登録できない' do
      @user.first_name_kana = "はなこ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana 全角カナ文字を使用して下さい")
    end
    
    it 'birthdayが空だと登録できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    
    it 'telephoneが空だと登録できない' do
      @user.telephone = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Telephone can't be blank")
    end
    
    it 'telephoneが半角数字以外だと登録できない' do
      @user.telephone = '０９０１２３４５６７８'
      @user.valid?
      expect(@user.errors.full_messages).to include("Telephone is invalid. 11桁以内の半角数字で入力してください")
    end
    
    it 'telephoneが12桁以上だと登録できない' do
      @user.telephone = '090123456789'
      @user.valid?
      expect(@user.errors.full_messages).to include("Telephone is invalid. 11桁以内の半角数字で入力してください")
    end

  end
end
