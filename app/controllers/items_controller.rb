class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index]
  before_action :set_new, only:[:new]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end


  private
  def item_params
    params.require(:item).permit(:name, :profile, :detail, :category_id, :delivery_fee_id, :prefecture_id, :shipment_days_id, :fee, :image).merge(user_id: current_user.id)
  end

  def set_new
    if user_signed_in? && current_user.user_check_id != 1
      redirect_to root_path
    end
  end

end
