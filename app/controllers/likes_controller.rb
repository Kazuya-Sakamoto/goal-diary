class LikesController < ApplicationController
    before_action :current_user

    def create
      Like.create(like_params)
      respond_to do |format|
        format.html { redirect_to root_path, notice: 'いいねしました'}
        format.json
        # binding.pry
      end
    end

    def destory
  
    end

    private
    def like_params
      params.permit().merge(user_id: current_user.id, diary_id: params[:diary_id])
    end
  end
