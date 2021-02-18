require 'rails_helper'
RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.nickname = ''  # nicknameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.email = ''  # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    
    it "passwordが数字のみ登録できない" do
      user = User.new(nickname: "マル太郎", email: "maruyama@gmail.com", password: "123456", password_confirmation: "123456", last_name: "丸山", first_name: "洋行", last_kana: "マルヤマ", first_kana: "ヒロユキ", birth_day: "1995-02-23")
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end

    it "passwordがアルファベットのみでは登録できない" do
      user = User.new(nickname: "マル太郎", email: "maruyama@gmail.com", password: "abcdef", password_confirmation: "abcdef", last_name: "丸山", first_name: "洋行", last_kana: "マルヤマ", first_kana: "ヒロユキ", birth_day: "1995-02-23")
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end

    it "password1が空だと登録できない" do
      user = User.new(nickname: "マル太郎", email: "maruyama@gmail.com", password: "", password_confirmation: "123abc", last_name: "丸山", first_name: "洋行", last_kana: "マルヤマ", first_kana: "ヒロユキ", birth_day: "1995-02-23")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank", "Password is invalid", "Password confirmation doesn't match Password")
    end


    it "password2が空だと登録できない" do
      user = User.new(nickname: "マル太郎", email: "maruyama@gmail.com", password: "123abc", password_confirmation: "", last_name: "丸山", first_name: "洋行", last_kana: "マルヤマ", first_kana: "ヒロユキ", birth_day: "1995-02-23")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが一致してないので登録できない" do
      user = User.new(nickname: "マル太郎", email: "maruyama@gmail.com", password: "123abcd", password_confirmation: "123abc", last_name: "丸山", first_name: "洋行", last_kana: "マルヤマ", first_kana: "ヒロユキ", birth_day: "1995-02-23")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "lastnameが空だと登録できない" do
      user = User.new(nickname: "マル太郎", email: "maruyama@gmail.com", password: "123abc", password_confirmation: "123abc", last_name: "", first_name: "洋行", last_kana: "マルヤマ", first_kana: "ヒロユキ", birth_day: "1995-02-23")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
    end

    it "lastnameが日本語でないと登録できない" do
      user = User.new(nickname: "マル太郎", email: "maruyama@gmail.com", password: "123abc", password_confirmation: "123abc", last_name: "maruyama", first_name: "洋行", last_kana: "マルヤマ", first_kana: "ヒロユキ", birth_day: "1995-02-23")
      user.valid?
      expect(user.errors.full_messages).to include("Last name is invalid")
    end

    it "firstnameが空だと登録できない" do
      user = User.new(nickname: "マル太郎", email: "maruyama@gmail.com", password: "123abc", password_confirmation: "123abc", last_name: "丸山", first_name: "", last_kana: "マルヤマ", first_kana: "ヒロユキ", birth_day: "1995-02-23")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
    end

    it "firstnameが日本語でないと登録できない" do
      user = User.new(nickname: "マル太郎", email: "maruyama@gmail.com", password: "123abc", password_confirmation: "123abc", last_name: "丸山", first_name: "123", last_kana: "マルヤマ", first_kana: "ヒロユキ", birth_day: "1995-02-23")
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid")
    end

    it "last_kanaが空だと登録できない" do
      user = User.new(nickname: "マル太郎", email: "maruyama@gmail.com", password: "123abc", password_confirmation: "123abc", last_name: "丸山", first_name: "洋行", last_kana: "", first_kana: "ヒロユキ", birth_day: "1995-02-23")
      user.valid?
      expect(user.errors.full_messages).to include("Last kana can't be blank", "Last kana is invalid")
    end

    it "last_kanaがカタカナでないと登録できない" do
      user = User.new(nickname: "マル太郎", email: "maruyama@gmail.com", password: "123abc", password_confirmation: "123abc", last_name: "丸山", first_name: "洋行", last_kana: "丸山さん", first_kana: "ヒロユキ", birth_day: "1995-02-23")
      user.valid?
      expect(user.errors.full_messages).to include( "Last kana is invalid")
    end

    it "first_kanaが空だと登録できない" do
      user = User.new(nickname: "マル太郎", email: "maruyama@gmail.com", password: "123abc", password_confirmation: "123abc", last_name: "丸山", first_name: "洋行", last_kana: "マルヤマ", first_kana: "", birth_day: "1995-02-23")
      user.valid?
      expect(user.errors.full_messages).to include("First kana can't be blank", "First kana is invalid")
    end

    it "first_kanaがカタカナでないと登録できない" do
      user = User.new(nickname: "マル太郎", email: "maruyama@gmail.com", password: "123abc", password_confirmation: "123abc", last_name: "丸山", first_name: "洋行", last_kana: "マルヤマ", first_kana: "ひろゆき", birth_day: "1995-02-23")
      user.valid?
      expect(user.errors.full_messages).to include( "First kana is invalid")
    end

    it "birth_dayが空だと登録できない" do
      user = User.new(nickname: "マル太郎", email: "maruyama@gmail.com", password: "123abc", password_confirmation: "123abc", last_name: "丸山", first_name: "洋行", last_kana: "マルヤマ", first_kana: "ヒロユキ", birth_day: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birth day can't be blank")
    end

  end
end
