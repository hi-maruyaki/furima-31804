require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザ登録ができる時' do
      it 'すべてのカラムが正しく記述されている!' do
        @user
        expect(@user).to be_valid
      end
    end

    context 'ユーザ登録ができない時' do

      it 'nicknameが空だと登録できない' do
        @user.nickname = ''  # nicknameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'passwordが数字のみ登録できない' do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it 'passwordがアルファベットのみでは登録できない' do
        @user.password = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end


      it 'password2が空だと登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'passwordが一致してないので登録できない' do
        @user.password = "123abc"
        @user.password_confirmation = "123abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'lastnameが空だと登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank", "Last name is invalid"
      end

      it 'lastnameが日本語でないと登録できない' do
        @user.last_name = "maruyama"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid"
      end

      it 'firstnameが空だと登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank", "First name is invalid"
      end

      it 'firstnameが日本語でないと登録できない' do
        @user.first_name ="123"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end

      it 'last_kanaが空だと登録できない' do
        @user.last_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last kana can't be blank", "Last kana is invalid"
      end

      it 'last_kanaがカタカナでないと登録できない' do
        @user.last_kana = "丸山さん"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last kana is invalid"
      end

      it 'first_kanaが空だと登録できない' do
        @user.first_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First kana can't be blank", "First kana is invalid"
      end
      
      it 'first_kanaがカタカナでないと登録できない' do
        @user.first_kana = "ひろゆき"
        @user.valid?
        expect(@user.errors.full_messages).to include "First kana is invalid"
      end

      it 'birth_dayが空だと登録できない' do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
      
      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = "123ab"
        @user.password_confirmation = "123ab"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      
      it '全角では登録できないこと' do
        @user.password = "あいうえおか"
        @user.password_confirmation = "あいうえおか"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
    end
  end
end