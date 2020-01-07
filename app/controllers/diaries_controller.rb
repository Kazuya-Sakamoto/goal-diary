class DiariesController < ApplicationController
  before_action :set_find_diary, only: %i[show edit update destroy]
  # before_action :move_to_registration, except: [:index, :show]

  def index
    @diaries = Diary.includes(:user).page(params[:page]).per(12).order("created_at DESC") #順番大事 page→per→order
  end
  
  def new
    @diary = Diary.new
    if !user_signed_in?
      redirect_to new_user_registration_path, notice: '投稿には登録が必要です!'
    end
  end

  def create
    goal = Diary.new
    if goal.dates(diary_params[:goal]) >= 1
      Diary.create(diary_params)
      redirect_to root_path
    else 
      render :new, notice: '投稿には登録が必要です!'
    end
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
  
  def destroy
    @diary.destroy
    redirect_to root_path
  end

  # def category
  #   @diaries = Diary.where(category_id: params[:category_id]) 
  # end

  def search
    @posts = Pweet.search(params[:keyword])
  end
  
  private
  def diary_params
    params.require(:diary).permit(:content, :image, :goal, category_ids: [] ).merge(user_id: current_user.id)
  end

  def set_find_diary
    @diary = Diary.find(params[:id])
  end

  # def move_to_registration
  #   redirect_to new_user_registration_path unless user_signed_in?
  # end
end