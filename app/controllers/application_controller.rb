class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user
  before_action :fetch_documents

  private

  def fetch_documents
    @all_documents = Document.order(:pagenumber)

  end

  def authenticate_user
    if session[:user_id].present?
      @current_user = User.where(:id => session[:user_id]).first
      # finding a user
    end

    if @current_user.nil?
      session[:user_id] = nil
    end
  end



end

