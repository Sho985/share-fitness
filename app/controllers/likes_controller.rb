class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_like

  def create
    like = current_user.likes.build(post_id: params[:post_id])
    like.save
  end

  def destroy
    like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    like.destroy
  end

    private

    def set_like
      @post = Post.find(params[:post_id])
    end
end
