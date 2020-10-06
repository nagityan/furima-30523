require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "全項目が存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nicknameが空では登録できないこと" do
      @user.nickname =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name =nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", "First name 全角文字を使用してください")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name 全角文字を使用してください")
    end
    it "kana_firstが空では登録できないこと" do
      @user.kana_first =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first can't be blank", "Kana first 全角カナを使用してください")
    end
    it "kana_lastが空では登録できないこと" do
      @user.kana_last =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last 全角カナを使用してください")
    end
    it "birthdayが空では登録できないこと" do
      @user.birthday =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "emailが空では登録できないこと" do
      @user.email =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できないこと" do
      @user.password =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation =""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  
    it "first_nameが半角では登録できないこと" do
      @user.first_name ="test"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it "last_nameが半角では登録できないこと" do
      @user.last_name ="test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end

    it "kana_firstがカタカナ以外では登録できないこと" do
      @user.kana_first ="手"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first 全角カナを使用してください")
    end
    it "kana_lastがカタカナ以外では登録できないこと" do
      @user.kana_last ="手"
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last 全角カナを使用してください")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailは@を含まないと登録できないこと" do
      @user.email = "qwerqwer"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "パスワードは6文字未満では登録できないこと" do
      @user.password = "q"
      @user.password = "q"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが6文字以上であれば登録できること" do
      @user.password = "qwer1234"
      @user.password_confirmation = "qwer1234"
      expect(@user).to be_valid
    end
    it "パスワードは半角英数字混合でなければ登録できないこと" do
      @user.password = "qwerqwer"
      @user.password = "qwerqwer"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
  end
end
