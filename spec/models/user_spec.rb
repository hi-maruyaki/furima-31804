require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do

    before do
      @user = FactoryBot.build(:user)
    end

    it "登録できる!" do
      user.valid?
      expect(user.errors.full_messages).to include ""
    end

    it "nicknameが空だと登録できない" do
      user.nickname = ''  # nicknameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end

    it "emailが空では登録できない" do
      user.email = ''  # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end
    
    it "passwordが数字のみ登録できない" do
      user.password = "123456"
      user.valid?
      expect(user.errors.full_messages).to include "Password is invalid"
    end

    it "passwordがアルファベットのみでは登録できない" do
      user.password = "abcdef"
      user.valid?
      expect(user.errors.full_messages).to include "Password is invalid"
    end

    it "password1が空だと登録できない" do
      user.password = ""
      user.valid?
      expect(user.errors.full_messages).to include "Password can't be blank", "Password is invalid", "Password confirmation doesn't match Password"
    end


    it "password2が空だと登録できない" do
      user.password_confirmation = ""
      user.valid?
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "passwordが一致してないので登録できない" do
      user.password = "123abc"
      user.password_confirmation = "123abcd"
      user.valid?
      expect(user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "lastnameが空だと登録できない" do
      user.last_name = ""
      user.valid?
      expect(user.errors.full_messages).to include "Last name can't be blank", "Last name is invalid"
    end

    it "lastnameが日本語でないと登録できない" do
      user.last_name = "maruyama"
      user.valid?
      expect(user.errors.full_messages).to include "Last name is invalid"
    end

    it "firstnameが空だと登録できない" do
      user.first_name = ""
      user.valid?
      expect(user.errors.full_messages).to include "First name can't be blank", "First name is invalid"
    end

    it "firstnameが日本語でないと登録できない" do
      user.first_name ="123"
      user.valid?
      expect(user.errors.full_messages).to include "First name is invalid"
    end

    it "last_kanaが空だと登録できない" do
      user.last_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include "Last kana can't be blank", "Last kana is invalid"
    end

    it "last_kanaがカタカナでないと登録できない" do
      user.last_kana = "丸山さん"
      user.valid?
      expect(user.errors.full_messages).to include "Last kana is invalid"
    end

    it "first_kanaが空だと登録できない" do
      user.last_kana = ""
      user.valid?
      expect(user.errors.full_messages).to include "First kana can't be blank", "First kana is invalid"
    end

    it "first_kanaがカタカナでないと登録できない" do
      user.first_kana: "ひろゆき"
      user.valid?
      expect(user.errors.full_messages).to include "First kana is invalid"
    end

    it "birth_dayが空だと登録できない" do
      user.birth_day = ""
      user.valid?
      expect(user.errors.full_messages).to include "Birth day can't be blank"
    end

  end
end
