class DiariesController < ApplicationController
  def index
    @diaries = Diary.all
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.create(diary_params)
    redirect_to root_path(@diary)
  end

  def show
    @diary = Diary.find(params[:id])
  end

  private
  def diary_params
    params.require(:diary).permit(:title, :content, :image)
  end
end
