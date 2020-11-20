class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(:training_menus)
  end

  def new 
    @post = Post.new
    #postに保存される際にtraining_menusも同時に保存を開始する。
    @post.training_menus.build
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end


    private

    def post_params
      params.require(:post).permit(:comment, :image, 
      training_menus_attributes: %i[id part event weight repetition set_count]).merge(user_id: current_user.id)
    end
end