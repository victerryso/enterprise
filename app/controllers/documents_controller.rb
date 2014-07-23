class DocumentsController < ApplicationController
  def index
    # @revisions = Revision.all
    @documents = Document.all
    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @documents}
    end
  end

  def export
    @documents = Document.all
    send_data @documents.to_json, :filename => "documents.json"
  end

  # def import
  #   post = DataFile.save(params[:upload])
  #   render :text => "File has been uploaded successfully"
  # end
  # end

  def create
      @document = Document.new document_params
      #Add document to current user  * has_and_belongs to many relationship
      @document.user_id = @current_user.id
      @document.save

      flash[:notice] = "New document created."
      redirect_to @document
  end

  def new
    @document = Document.new
  end

  def edit
    @document = Document.find params[:id]
    @revision = Revision.new
  end

  def show
    @document = Document.find params[:id]
    @users = User.all
    @documents = Document.page(params[:page]).per(1)
    @document = Document.find params[:page] if params[:page]
  end

  def update
    document = Document.find params[:id]
    revision = Revision.new(document.attributes.slice('title', 'content'))

    revision.document_id = document.id
    revision.user_id = @current_user.id

    document.revisions << revision

    if document.update document_params
      flash[:notice] = '* One document revised and previous version stored *'
      redirect_to document
    else
      render :edit
    end
  end

  def destroy
    document = Document.find params[:id]
    document.destroy

    # revision = Revision.find params[:id]
    # # raise params.inspect
    # revision.destroy

    redirect_to documents_path
  end

private
  def document_params
    params.require(:document).permit(:title, :content, :pagenumber)
  end

  def revision_params
    params.require(:revision).permit(:title, :content, :pagenumber, :document_id)
  end
end
