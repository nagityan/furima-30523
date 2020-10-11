class PurchasesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @user_purchase = UserPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
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
      price = Item.find(item_id: item_id).price 
        Payjp::Charge.create(
          amount: price,
          card: token,    
          currency: 'jpy')
  end
end
