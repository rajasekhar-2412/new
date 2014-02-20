class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bookmark, only: [:show, :edit, :update, :destroy]

  # GET /bookmarks
  # GET /bookmarks.json
  def index
    @bookmarks = current_user.bookmarks.page params[:page]
    @custom = current_user.try(:customs).try(:last).try(:fields) || []
    respond_to do |format|
      format.html
      format.csv { send_data Bookmark.to_csv(@bookmarks) }
      format.xls { send_data Bookmark.to_csv(@bookmarks,col_sep: "\t")}
    end
  end

  # GET /bookmarks/1
  # GET /bookmarks/1.json
  def show
  end

  # GET /bookmarks/new
  def new
    @bookmark = Bookmark.new
    @custom_fields = current_user.try(:custom_requirements)  || []
    #raise @custom_fields.inspect
  end

  # GET /bookmarks/1/edit
  def edit
    @custom_fields = current_user.try(:custom_requirements)  || []
  end

  # POST /bookmarks
  # POST /bookmarks.json
  def create
    #raise params.inspect
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user_id = current_user.id
    #raise params[:custom].inspect

    respond_to do |format|
      if @bookmark.save
        @custom = Custom.create(:user_id => current_user.id, :fields => params[:custom], :bookmark_id => @bookmark.id)  if params[:custom]
        format.html { redirect_to @bookmark, notice: 'Book marks created successfully.' }
        format.json { render action: 'show', status: :created, location: @bookmark }
      else
        @custom_fields = current_user.try(:custom_requirements)  || []
        format.html { render action: 'new' ,@custom_fields => @custom_fields, notice: 'Please Review the following along with custom fields'}
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookmarks/1
  # PATCH/PUT /bookmarks/1.json
  def update
    respond_to do |format|
      if @bookmark.update(bookmark_params)
        if @bookmark.custom
          @custom = @bookmark.custom.update(:user_id => current_user.id, :fields => params[:custom], :bookmark_id => @bookmark.id)
        else
          @custom = Custom.create(:user_id => current_user.id, :fields => params[:custom], :bookmark_id => @bookmark.id)
        end
        format.html { redirect_to @bookmark, notice: 'Bookmark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookmarks/1
  # DELETE /bookmarks/1.json
  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html { redirect_to bookmarks_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_bookmark
    unless @bookmark = current_user.bookmarks.where(id: params[:id]).first
      flash[:alert] = 'Bookmark not found.'
      redirect_to root_url
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bookmark_params  #strong parameters
    params.require(:bookmark).permit(:title, :url,:category_id, :is_shared)
  end
end
