class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show, :search]
  before_action :set_new, only:[:new]
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  before_action :set_edit, only:[:edit, :update, :destroy]
  before_action :set_search, only:[:index, :show, :search]

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
    @item.user_id = current_user.id
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to user_path(current_user.id)
    end
  end

  def search
    @items= @search.result.order("created_at DESC")
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

  def set_item
    @item = Item.find(params[:id])
  end

  def set_edit 
    if @item.order.present?
      redirect_to root_path
    else
      if current_user.id != @item.user_id
        redirect_to root_path
      end
    end
  end

  def set_search
    @search = Item.ransack(params[:q])
  end
 
end