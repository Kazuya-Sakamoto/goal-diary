class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @diary = @user.diaries
    @diaries = current_user.diaries.page(params[:page]).per(12).order("created_at DESC")
  end
end
