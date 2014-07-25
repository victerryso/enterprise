# Controller methods to handle revision for documents
class RevisionsController < ApplicationController
  def index
    @revisions = Revision.all
  end

  def show
    @revision = Revision.find params[:id]
    @document = @revision.document
  end

  def destroy
    revision = Revision.find params[:id]
    # raise params.inspect
    revision.destroy
    
    flash[:notice] = "Revision is now destroyed."
    redirect_to documents_path
  end

private
  def revision_params
    params.require(:revision).permit(:title, :content, :document_id)
  end
end