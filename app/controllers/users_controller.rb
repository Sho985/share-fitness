class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :not_authorized_user, only: [:calendar, :graph, :timeline]
  
  def show
    @user =User.find(params[:id])
    @posts =@user.posts.order(created_at: 'DESC').page(params[:posts]).per(30)
    @like_posts = @user.like_posts.order(created_at: 'DESC').page(params[:like_posts]).per(30)
    @user_questions = @user.questions.order(created_at: 'DESC').page(params[:user_questions]).per(30)
  end

  def calendar
    @user =User.find(params[:id])
    @posts =@user.posts
  end

  def graph  
    @q =  TrainingEvent.includes(:training_menus).where(user_id: current_user.id).limit(15).order(created_at: 'ASC').ransack(params[:q])
    @training_event = @q.result(distinct: true)
  end

  def following
    @user =User.find(params[:id])
    @following_users = @user.followings
  end

  def followers
    @user =User.find(params[:id])
    @followers = @user.followers
  end

  def timeline
    @user =User.find(params[:id])
    @following_users = @user.followings
    @posts = Post.all.includes(:training_events).where(user_id: @following_users).order(created_at: 'DESC').page(params[:page]).per(30)
  end

    private

    def not_authorized_user
      user = User.find(params[:id])
      if user.id != current_user.id
        redirect_to user_path(current_user), alert: "アクセス権限がありません"
      end
    end

end
