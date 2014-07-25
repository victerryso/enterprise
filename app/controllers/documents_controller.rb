# Controller methods for documents, including search function for documents, JSON export and 
# function to retrieve external document pdf links 

class DocumentsController < ApplicationController
  def index  
    if params[:search]
      search_function
      render :search_results
      return
    else
      @document = Document.find_by(:pagenumber => params[:page] || 1)
      @documents = Document.page(params[:page]).per(1)
      linking_refs
    end

    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @documents }
    end
  end

  def export
    @documents = Document.all
    send_data @documents.to_json, :filename => "documents.json"
  end

  # this would have been an import JSON file function feature
  # def import
  #   post = DataFile.save(params[:upload])
  #   render :text => "File has been uploaded successfully"
  # end
  # end

  def create
    @document = Document.new document_params
    @document.user = @current_user
    if @document.save
      flash[:notice] = "New document created."
      redirect_to @document
    else
      flash[:notice] = "Did not successfully create new document"
      render :new
    end
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
    # would write @visuals = @document.visuals
    # if didn't include document.visuals through associations on view page
    # but is highly more preferable to effectively use associations
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
    # see model file for document, destroy all document dependent that includes revision
    # revision = Revision.find params[:id]
    # # raise params.inspect
    # revision.destroy
    redirect_to documents_path
  end

private
  def document_params
    params.require(:document).permit(:title, :content, :pagenumber,
                                      visuals_attributes:
                                      [:id, :title, :_destroy, :image, :image_cache, :remote_image_url])
  end

  def revision_params
    params.require(:revision).permit(:title, :content, :pagenumber, :document_id,
                                      visuals_attributes: [:id, :title, :_destroy])
  end

  def search_function
    search = params[:search]
    @documents = []
    unless search == ""
      @documents << Document.where("title ILIKE :search", search: "%#{ search }%") # % retrieves everything before and after 'and'
      @documents << Document.where("content ILIKE :search", search: "%#{ search }%") # ILIKE enables search term to becase insensitive
      @documents = @documents.flatten.uniq
    end
  end

  def linking_refs
    array = {"AASB 101" => "http://www.aasb.gov.au/admin/file/content105/c9/AASB101_09-07_NFP_COMPdec12_07-13.pdf"}
    @document.content.gsub!(/((AASB \d+)\S+)/) do |str1|
      if array.has_key?($2)
        "[#{$1}](#{array[$2]})" # Joel did this but let's never speak of it again or to him again about regex
      else
        str1
      end
    end
  end
end


