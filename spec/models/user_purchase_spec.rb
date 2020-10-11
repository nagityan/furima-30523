require 'rails_helper'

RSpec.describe UserPurchase, type: :model do
  describe '#purchase' do
    before do
      @user_purchase = FactoryBot.build(:user_purchase)
    end

    it "全項目が存在すれば登録できること" do
      expect(@user_purchase).to be_valid
    end

    it "postal_codeが空では登録できないこと" do
      @user_purchase.postal_code =""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
    end

    it "postal_codeが半角のハイフンを含んだ正しい形でないと登録できないこと" do
      @user_purchase.postal_code ="123ー4567"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Postal code is invalid")
    end

    it "prefecture_idが1では登録できないこと" do
      @user_purchase.prefecture_id = 1
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it "cityが空では登録できないこと" do
      @user_purchase.city =""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("City can't be blank")
    end

    it "addressが空では登録できないこと" do
      @user_purchase.address =""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Address can't be blank")
    end

    it "phone_numberが空では登録できないこと" do
      @user_purchase.phone_number =""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it "phone_numberが11桁以下でないと登録できないこと" do
      @user_purchase.phone_number ="0001234567891011"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberがハイフンがあると登録できないこと" do
      @user_purchase.phone_number ="000-0000-0000"
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Phone number is invalid")
    end

    it "phone_numberが正しい形式だとと登録できること" do
      @user_purchase.phone_number ="00010001000"
      expect(@user_purchase).to be_valid
    end

    it "tokenが空だと登録できないこと" do
      @user_purchase.token =""
      @user_purchase.valid?
      expect(@user_purchase.errors.full_messages).to include("Token can't be blank")
    end
  end
end
