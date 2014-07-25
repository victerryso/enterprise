# Controller methods for handling comments within Forum feature

class CommentsController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    @comment = Comment.create comment_params
    @comment.user = @current_user
    @comment.save
    
    @post.comments << @comment

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :post_id, :post, :comments)
  end
end
