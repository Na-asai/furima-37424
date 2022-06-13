require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "a00000000", password_confirmation: "a00000000", last_name: "やまだ", first_name: "たろう", last_name_kana: "ヤマダ", first_name_kana:"タロウ", birth: 1990-02-15)
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
    end
    it "passwordが空だと登録できない" do
    end
    it "last_nameが空だと登録できない" do
    end
    it "first_nameが空だと登録できない" do
    end
    it "last_name_kanaが空だと登録できない" do
    end
    it "first_name_kanaが空だと登録できない" do
    end
    it "birthが空だと登録できない" do
    end
  end
end