class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :create]
  before_action :set_item, only:[:index, :create]
  before_action :set_out, only:[:index, :create]

  def index
    if current_user.id == @item.user_id 
      redirect_to root_path
    end
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :house_name, :telephone)
    .merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
  end

  def set_out
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.fee,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
end
