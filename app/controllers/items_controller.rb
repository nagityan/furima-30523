class ItemsController < ApplicationController
  #ログインしていないユーザーでもTOPと詳細画面は見ることができる
  before_action :authenticate_user!, except: [:index, :show]

  #@itemを定義
  before_action :find_item, only:[:show,:edit,:update,:destroy]

  #購入済の商品の"編集画面"には遷移できない
  before_action :move_to_top,only:[:edit]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_data)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  #ページ移行時に手数料などの表示のため
  def edit
    @price_fee = (@item.price * 0.1).to_i
    @profit = (@item.price - @price_fee).to_i
  end

  def update
    if @item.update(params_data)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def params_data
    params.require(:item).permit(:title,:explanation,:category_id,:price,:status_id,:burden_of_delivery_fee_id,:shipping_area_id,:shipping_date_id,:image).merge(user_id:current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def move_to_top
    if current_user.id != @item.user_id  || @item.purchase.present?
      redirect_to root_path
    end
  end
end
