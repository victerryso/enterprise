class CommentsController < ApplicationController
  def create
    @post = Post.find params[:post_id]
    @comment = Comment.create comment_params
    @post.comments << @comment
    # @comment = @post.comments.create params[:comment]
    redirect_to post_path(@post)
  end

  # def new
  #   @user = @current_user
  #   @comment = Comment.new
  # end

  # def edit
  #   @comment = Comment.find params[:id]
  # end

  # def show
  #   @comment = Comment.find params[:id]
  # end
  

  # def update
  #   comment = Comment.find params[:id] 
  #   comment.update comment_params
  #   redirect_to post
  # end

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
