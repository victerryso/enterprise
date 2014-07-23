class VisualsController < ApplicationController
  def index
    @visuals = Visual.all
  end

  def new
    @visual = Visual.new
  end

  def create
    @visual = Visual.new visual_params
    if @visual.save
      redirect_to visuals_path
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
    visual = Visual.find params[:id]
    flash[:notice] = '* Image removed *'
    visual.destroy

    redirect_to documents_path
  end

  private
  def visual_params
    params.require(:visual).permit(:title, :image, :image_cache)
  end
end

