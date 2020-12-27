class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:calendar]
  
  def show
    @user =User.find(params[:id])
    @posts =@user.posts.order(created_at: 'DESC')
    @like_posts = @user.like_posts
    @user_questions = @user.questions.order(created_at: 'DESC')
  end

  def calendar
    @user =User.find(params[:id])
    @posts =@user.posts
  end

  def graph  
    @q =  TrainingMenu.where(user_id: current_user.id).limit(15).ransack(params[:q])
    @training_event = @q.result(distinct: true)
  end
end
