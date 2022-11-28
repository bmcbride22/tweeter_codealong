class LikesController < ApplicationController
  before_action :set_likable

  def create
    if @likeable.likes.count >= 1 && @likeable.liked_by?(current_user)
      @like = Like.find_by(likeable_id: @likeable.id, user_id: current_user)
      @like.destroy
    else
      @like = @likeable.likes.new
      @lise.user = current_user
      @like.save!
    end
  end

  private

  def set_likable
    @likeable = params[:likeable_type].constantize.find(params[:likeable_id])
  end
end
