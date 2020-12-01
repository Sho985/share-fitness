class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  #投稿者以外、編集・削除できない
  before_action :correct_user, only: [:destroy]

  def index
    @q = Post.all.includes(:training_menus).order(created_at: 'DESC').ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def show
    @post = Post.includes(:training_menus).find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end

  def new 
    @post = Post.new
    #postに保存される際にtraining_menusも同時に保存を開始する。
    @post.training_menus.build
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: 'トレーニング内容を記録しました!'
    else
      flash.now[:alert] = '記録に失敗しました'
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(update_post_params)
      redirect_to posts_path, notice: '更新が完了しました！'
    else
      flash.now[:alert] = '更新に失敗しました'
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
      params.require(:post).permit(:comment, :image, 
      training_menus_attributes: %i[id part event weight repetition set_count]).merge(user_id: current_user.id)
    end

    def update_post_params
      params.require(:post).permit(:comment, :image, 
      training_menus_attributes: %i[id part event weight repetition set_count _destroy]).merge(user_id: current_user.id)
    end

    #投稿ユーザーとログインユーザーが正しくないとアクセスできない
    def correct_user
      post = Post.find(params[:id])
      if post.user_id != current_user.id
        redirect_to user_path(current_user), alert: 'アクセス権限がありません'
      end
    end
end