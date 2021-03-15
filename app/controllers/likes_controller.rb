class LikesController < ApplicationController
  before_action :authenticate_user!, only:[:create, :destroy]
  before_action :set_item, only:[:create, :destroy]

  def create
    @like = current_user.likes.create(item_id: params[:item_id])  
  end

  def destroy
    @like = current_user.likes.find_by(item_id: @item.id)
    @like.destroy
  end

  private 
  def set_item
  @item = Item.find(params[:item_id])
  end

end
