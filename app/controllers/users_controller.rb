class UsersController < ApplicationController
  def show
    @user =User.find(params[:id])
    @like_posts = @user.like_posts
  end
end
