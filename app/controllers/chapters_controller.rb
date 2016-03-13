class ChaptersController < ApplicationController
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = Chapter.all
    authorize @chapters
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    @chapter = Chapter.find(params[:id])
    @book = Book.find(params[:book_id])
    @chapter.book = @book
    authorize @chapter
  end

  # GET /chapters/new
  def new
    @book = Book.find(params[:book_id])
    @chapter = Chapter.new
    @tableofcontent = Tableofcontent.new
    authorize @chapter
  end

  # GET /chapters/1/edit
  def edit
    @book = Book.find(params[:book_id])
    @chapter = Chapter.find(params[:id])
    authorize @chapter
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @book = Book.find(params[:book_id])
    @chapter = Chapter.new(chapter_params)
    @tableofcontent = Tableofcontent.new
    @chapter.book = @book
    authorize @chapter

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to [@book], notice: 'Chapter was successfully created.' }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    @book = Book.find(params[:book_id])
    @chapter = Chapter.new(chapter_params)
    @chapter.book = @book
    authorize @chapter
    respond_to do |format|
      if @chapter.update(chapter_params)
        format.html { redirect_to [@book], notice: 'Chapter was successfully updated.' }
        format.json { render :show, status: :ok, location: @chapter }
      else
        format.html { render :edit }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @book = Book.find(params[:book_id])
    @chapter.destroy
    authorize @chapter
    respond_to do |format|
      format.html { redirect_to @chapter.book, notice: 'Chapter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:title, :body, :published, :public, :author, :book_id, :tableofcontent_id)
    end
end
