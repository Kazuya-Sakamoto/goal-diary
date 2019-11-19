class DiariesController < ApplicationController
  before_action :set_find_diary, only: %i[show edit update destroy]

  def index
    @diaries = Diary.includes(:user).page(params[:page]).per(12).order("created_at DESC") #順番大事 page→per→order
  end
  
  def new
    @diary = Diary.new
  end

  def show
    @comment = Comment.new
    @comments = @diary.comments.includes(:user)
    @like = Like.new
    @likes = @diary.likes.includes(:user)
  end

  def edit
  end

  def update
    @diary.update(diary_params)
    redirect_to diary_path
  end

  def create
    Diary.create(diary_params)
    redirect_to root_path
  end
  
  def destroy
    @diary.destroy
    redirect_to root_path
  end

  private
  def diary_params
    params.require(:diary).permit(:content, :image, :goal).merge(user_id: current_user.id)
  end

  def set_find_diary
    @diary = Diary.find(params[:id])
  end
end