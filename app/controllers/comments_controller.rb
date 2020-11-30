class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    Comment.find_by(id: params[:id],post_id: params[:post_id]).destroy
    redirect_back(fallback_location: root_path) 
  end

  private
    
    def comment_params
      params.require(:comment).permit(:content).merge(user_id: current_user.id)
    end
    
end
