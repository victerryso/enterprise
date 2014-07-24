class PostsController < ApplicationController

   def index
    if params[:search]
      search_function
    else
      @posts = Post.all
    end
  end 

  def create
    post = Post.new post_params
    post.user = @current_user
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
    @comments = Comment.where :post_id => params[:id]
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

  private
  def post_params
    params.require(:post).permit(:username, :title, :body, :image, :user_id)
  end

  def search_function
    search = params[:search]
    @posts = []
    unless search == ""
      # Author.column_names[1..-3].each do #the search yadayada
      @posts << Post.where("title ILIKE :search", search: "%#{ search }%") # % % means get everything before nd get everything after
      @posts << Post.where("body ILIKE :search", search: "%#{ search }%") # ILIKE makes it case insensitive
      @posts = @posts.flatten.uniq
    end
  end

end