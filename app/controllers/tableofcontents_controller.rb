class TableofcontentsController < ApplicationController
  before_action :set_tableofcontent, only: [:show, :edit, :update, :destroy]

  # GET /tableofcontents
  # GET /tableofcontents.json
  def index
    @tableofcontents = Tableofcontent.all
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:chapter_id])
  end

  # GET /tableofcontents/1
  # GET /tableofcontents/1.json
  def show
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:chapter_id])
    @tableofcontent = Tableofcontent.find(params[:id])

  end

  # GET /tableofcontents/new
  def new
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:chapter_id])
    @tableofcontent = Tableofcontent.new
  end

  # GET /tableofcontents/1/edit
  def edit
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:chapter_id])
  end

  # POST /tableofcontents
  # POST /tableofcontents.json
  def create
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:chapter_id])
    @tableofcontent = Tableofcontent.new(tableofcontent_params)
    @tableofcontent.chapter = @chapter

    respond_to do |format|
      if @tableofcontent.save
        format.html { redirect_to [@book, @chapter], notice: 'Tableofcontent was successfully created.' }
        format.json { render :show, status: :created, location: @tableofcontent }
      else
        format.html { render :new }
        format.json { render json: @tableofcontent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tableofcontents/1
  # PATCH/PUT /tableofcontents/1.json
  def update
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:chapter_id])
    @tableofcontent = Tableofcontent.find(params[:id])
    respond_to do |format|
      if @tableofcontent.update(tableofcontent_params)
        format.html { redirect_to [@book, @chapter, @tableofcontent], notice: 'Tableofcontent was successfully updated.' }
        format.json { render :show, status: :ok, location: @tableofcontent }
      else
        format.html { render :edit }
        format.json { render json: @tableofcontent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tableofcontents/1
  # DELETE /tableofcontents/1.json
  def destroy
    @book = Book.find(params[:book_id])
    @chapter = @book.chapters.find(params[:chapter_id])
    @tableofcontent = @chapter.tableofcontents.find(params[:id])
    @tableofcontent.destroy
    respond_to do |format|
      format.html { redirect_to [@book, @chapter], notice: 'Tableofcontent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tableofcontent
      @tableofcontent = Tableofcontent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tableofcontent_params
      params.require(:tableofcontent).permit(:title, :description, :body, :public, :author, :chapter_id, :book_id)
    end
end
