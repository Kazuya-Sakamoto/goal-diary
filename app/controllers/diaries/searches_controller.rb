class Diaries::SearchesController < ApplicationController
  def index
    @diaries = Diary.search(params[:keyword])
  end
end
