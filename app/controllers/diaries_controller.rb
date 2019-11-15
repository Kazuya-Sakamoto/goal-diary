class DiariesController < ApplicationController
  def index
    @diaries = Diary.includes(:user)
  end
  
  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    diary = Diary.find(params[:id])
    diary.update(diary_params)
    redirect_to diary_path(diary.id)
  end

  def new
    @diary = Diary.new
  end

  def create
    Diary.create(diary_params)
    redirect_to root_path
  end
  
  def destroy
    diary = Diary.find(params[:id])
    diary.destroy
    redirect_to root_path
  end

  def show
    @diary = Diary.find(params[:id])
    @comment = Comment.new
    @comments = @diary.comments.includes(:user)
  end

  private
  def diary_params
    params.require(:diary).permit(:content, :image, :goal).merge(user_id: current_user.id)
  end
end
