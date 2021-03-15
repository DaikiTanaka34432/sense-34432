class UsersController < ApplicationController
  def show
    @user =User.find(params[:id])
    @items = @user.items.order("created_at DESC")
    @like_item = @user.likes
  end

  def edit
    @user =User.find(params[:id])
  end

  def update
    @user =User.find(params[:id])
    if @user.update(user_params)
      bypass_sign_in(@user)  
      redirect_to user_path(params[:id])
    else
      render :edit 
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :telephone, :office_id, :career, :introduction)
  end
end
