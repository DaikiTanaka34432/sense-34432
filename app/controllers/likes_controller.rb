class LikesController < ApplicationController
  before_action :set_item

  def create
    @like = current_user.likes.create(item_id: params[:item_id])  
    #current_userに結びついたいいねを作成,item_id: params[:item_id])でいいねしたitemのidを@likeに入れる。
  end

  def destroy
    @like = current_user.likes.find_by(item_id: @item.id)
    @like.destroy
  end

  private 
  def set_item
  @item = Item.find(params[:item_id])
   # どのitemに結びついているいいねを削除するのかを探して持ってくる。
  end

end
