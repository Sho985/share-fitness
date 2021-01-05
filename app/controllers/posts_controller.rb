class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  #投稿者以外、編集・削除できない
  before_action :correct_user, only: [:destroy]

  def index
    @q = Post.all.includes(:training_events).order(created_at: 'DESC').ransack(params[:q])
    @posts = @q.result(distinct: true).page(params[:page]).per(30)
  end

  def show
    @post = Post.all.includes(:training_events).find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.order(created_at: 'ASC').page(params[:page]).per(10)
  end

  def new 
    @post = Post.new
    @post.training_parts.build
    @training_event = @post.training_events.build
    @training_event.training_menus.build 
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: 'トレーニング内容を記録しました!'
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: '更新が完了しました！'
    else
      render 'edit'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, notice: '削除が完了しました！'
  end
    
    private

    def post_params
      params.require(:post).permit(
      :comment, :image, 
      training_parts_attributes: [:id, :part, :user_id],
      training_events_attributes: [:id, :event, :user_id, :_destroy,  
      training_menus_attributes: %i[id weight repetition set_count _destroy]
      ]
      ).merge(user_id: current_user.id)
    end

    #投稿ユーザーとログインユーザーが正しくないとアクセスできない
    def correct_user
      post = Post.find(params[:id])
      if post.user_id != current_user.id
        redirect_to user_path(current_user), alert: 'アクセス権限がありません'
      end
    end
end