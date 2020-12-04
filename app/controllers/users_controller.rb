class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:calendar]
  
  def show
    @user =User.find(params[:id])
    @posts =@user.posts
    @like_posts = @user.like_posts
  end

  def calendar
    @user =User.find(params[:id])
    @posts =@user.posts
  end
end
