class PurchasesController < ApplicationController
  #ログインの状態に関わらず、購入済の商品の"購入画面"には遷移できない
  before_action :move_to_top,only:[:new]

  #ログインしていないユーザーはログイン画面へ
  before_action :authenticate_user!

  #@を定義
  before_action :item_find
  
  #購入しようとしている人が出品者だった場合にリダイレクトする
  before_action :go_to_top

  def new
    @user_purchase = UserPurchase.new
  end

  #購入後はTOPページへ遷移
  def create
    @user_purchase = UserPurchase.new(params_data)
    if @user_purchase.valid?
      pay_item
      @user_purchase.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private
  def params_data
    params.require(:user_purchase).permit(:postal_code,:prefecture_id,:city,:address,:building,:phone_number).merge(token:params[:token],item_id: params[:item_id],user_id:current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      price = @item.price 
        Payjp::Charge.create(
          amount: price,
          card: params[:token],    
          currency: 'jpy')
  end
  
  def move_to_top
    if Item.find(params[:item_id]).purchase.present?
      redirect_to root_path
    end
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def go_to_top
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end

