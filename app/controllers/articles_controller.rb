class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def meta_tag
    set_meta_tags title: @article.title,
                  description: @article.body,
                  keywords: @article.title
  end

  # GET /articles
  # GET /articles.json
  def index
    set_meta_tags title: "Employment Law Articles",
                  description: "Human Resource Advice from Wilson Worley Law Firm",
                  keywords: 'Human Resources, Virginia, Federal, Law, Forms, Policies'
    @email = Email.new
    @articles = Article.friendly.all
    @book = Book.first
    @chapter = @book.chapters
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    meta_tag
    @email = Email.new
    @article = Article.friendly.find(params[:id])
    @articles = Article.all
    @book = Book.first
    @chapter = @book.chapters
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :description, :body, :published, :image, :blogpicture, :hiring, :firing, :good_read, :holidays_vacations, :forms_policies, :leave_disability, :management, :performance, :safety_health, :wages, :webinars_events, :harrassment)
    end
end
