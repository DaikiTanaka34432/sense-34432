class LikesController < ApplicationController

  def create
    @item = current_user.likes.create(item_id: params[:item_id]) 
    #current_userに結びついたいいねを作成
    redirect_back(fallback_location: root_path)
    #一覧画面でいいねしたら一覧画面へ戻る、詳細画面でいいねしたら詳細画面に戻るという記述
    #fallback_location:は、万が一ひとつ前の画面が見つけられなかったら別のpathに飛ぶという記述

  end

  def destroy
    @item = Item.find(params[:item_id])
    @like = current_user.likes.find_by(item_id: @item.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

end
