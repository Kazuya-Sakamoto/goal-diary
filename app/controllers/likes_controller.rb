class LikesController < ApplicationController
  # before_action :current_user

  def create
    @diary = Diary.find(params[:diary_id])
    @like = Like.new(like_params)
    if @like.save
      respond_to do |format|
        format.html { redirect_to diaries_path, notice: 'いいねしました'}
        format.json 
      end
    end
  end

  def destory
    # @diary = Diary.find(params[:diary_id])
    # @like = Like.destory(like_params)
    # if respond_to do |format|
    #   format.json
    # end
  end

  private
    def like_params
      params.permit().merge(user_id: current_user.id, diary_id: params[:diary_id])
    end
  end
end

