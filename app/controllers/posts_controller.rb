class PostsController < ApplicationController

   def index
          
      @posts = Post.all

   end 

   def create
    post = Post.new post_params
    if @current_user.nil?
      redirect_to root_path
    else
      post.user_id = @current_user.id
      post.save
      redirect_to post
    end
   end

  def new
    @user = @current_user
    @post = Post.new
  end

  def edit
    @post = Post.find params[:id]
  end

  def show
    @post = Post.find params[:id]
  end
  
  def update
    post = Post.find params[:id] 
    post.update post_params
    redirect_to post
  end
  
  def destroy
    post = Post.find params[:id] 
    post.destroy
    redirect_to posts_path
  
  end



  def author
    @posts = Post.where(:user_id => params[:id])
    render :index
  end

  private
  def post_params
    params.require(:post).permit(:username, :title, :body, :image, :user_id)
  end
end