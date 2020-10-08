class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only:[:show]
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


  private
  def params_data
    params.require(:item).permit(:title,:explanation,:category_id,:price,:status_id,:burden_of_delivery_fee_id,:shipping_area_id,:shipping_date_id,:image).merge(user_id:current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
