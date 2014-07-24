class DocumentsController < ApplicationController
  def index
    @documents = Document.all
    respond_to do |format|
      format.html #index.html.erb
      format.json { render json: @documents }
    end

    if params[:search]
      @doc_search = Document.search(params[:search]).order("created_at DESC")
    else
      @doc_search = Document.order("created_at DESC")
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

    @documents = Document.page(params[:page]).per(1)
    @document = Document.find params[:page] if params[:page]

    linking_refs
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
      # Author.column_names[1..-3].each do #the search yadayada
      @documents << Document.where("title ILIKE :search", search: "%#{ search }%") # % % means get everything before nd get everything after
      @documents << Document.where("content ILIKE :search", search: "%#{ search }%") # ILIKE makes it case insensitive
      @documents = @documents.flatten.uniq
    end
  end

  def linking_refs
    array = {"AASB 101" => "http://www.aasb.gov.au/admin/file/content105/c9/AASB101_09-07_NFP_COMPdec12_07-13.pdf"}
    @document.content.gsub!(/((AASB \d+)\S+)/) do |str1|
      if array.has_key?($2)
        "[#{$1}](#{array[$2]})" # Joel did this but let's never speak of it again.
      else
        str1
      end
    end
    # p content.gsub(/AASB \S+/) { |str| '[' + str + '](' + array[str] + ')'  }

  end

  def highlight(text, phrases, options = {})
    text = sanitize(text) if options.fetch(:sanitize, true)

    if text.blank? || phrases.blank?
      text
    else
      highlighter = options.fetch(:highlighter, '<mark>\1</mark>')
      match = Array(phrases).map { |p| Regexp.escape(p) }.join('|')
      text.gsub(/(#{match})(?![^<]*?>)/i, highlighter)
    end.html_safe
  end
end


