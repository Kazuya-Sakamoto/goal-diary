class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @diaries = @user.diaries.page(params[:page]).per(12).order("created_at DESC") 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    current_user.update(user_params)
    redirect_to user_path(current_user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:introduction)
  end
end
