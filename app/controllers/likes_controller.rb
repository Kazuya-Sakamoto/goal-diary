class LikesController < ApplicationController
    before_action :current_user

    def create
      Like.create(like_params)
      redirect_to root_path
    end

    def destory
      # Like.destory(like_params)
      # redirect_to root_path
    end

    private
    def like_params
      params.permit().merge(user_id: current_user.id, diary_id: params[:diary_id])
    end
  end
