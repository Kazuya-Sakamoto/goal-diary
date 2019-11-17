class DiariesController < ApplicationController
  def index
    @diaries = Diary.includes(:user).page(params[:page]).per(12).order("created_at DESC") #順番大事 page→per→order
  end
  
  def new
    @diary = Diary.new
  end

  def show
    @diary = Diary.find(params[:id])
    @comment = Comment.new
    @like = Like.new
    @comments = @diary.comments.includes(:user)
    @likes = @diary.likes.includes(:user)
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    diary = Diary.find(params[:id])
    diary.update(diary_params)
    redirect_to diary_path(diary.id)
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

  private
  def diary_params
    params.require(:diary).permit(:content, :image, :goal).merge(user_id: current_user.id)
  end
end