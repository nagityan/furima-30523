require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    it "全項目が存在すれば登録できること" do
      expect(@item).to be_valid
    end

    it "titleが空では登録できないこと" do
      @item.title =""
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it "explanationが空では登録できないこと" do
      @item.explanation =""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it "category_idが1では登録できないこと" do
      @item.category_id =1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end


    it "status_idが1では登録できないこと" do
      @item.status_id =1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end


    it "burden_of_delivery_fee_idが1では登録できないこと" do
      @item.burden_of_delivery_fee_id =1
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden of delivery fee must be other than 1")
    end

    it "shipping_area_idが1では登録できないこと" do
      @item.shipping_area_id =1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
    end

    it "shipping_date_idが1では登録できないこと" do
      @item.shipping_date_id =1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
    end

    it "imageが空では登録できないこと" do
      @item.image =nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "priceが空では登録できないこと" do
      @item.price =""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it "priceが300以下だと登録できないこと" do
      @item.price = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "priceが9999999以上だと登録できないこと" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it "priceが半角以外だと登録できないこと" do
      @item.price = "１００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "priceが300だと登録できること" do
      @item.price = 300
      expect(@item).to be_valid
    end

    it "priceが9999999だと登録できること" do
      @item.price = 9999999
      expect(@item).to be_valid
    end
  end
end
