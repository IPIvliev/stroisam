class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :tog]

  # GET /articles
  # GET /articles.json
  def index
    set_meta_tags noindex: true

      @articles = initialize_grid(Article,
        order:           'articles.created_at',
        order_direction: 'desc',
      )
  end

  def tag
    @articles = if params[:tag]
        set_meta_tags :title => params[:tag]
      tag = ActsAsTaggableOn::Tag.find_by_slug(params[:tag])
      Article.where("view = ?", true).order("created_at DESC").friendly.tagged_with(tag).page(params[:page]).per(5)
    else
      Article.where("view = ?", true).order("created_at DESC").page(params[:page]).per(10)
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    add_breadcrumb @article.name, category_article_path(@article.category, @article)
    
    @comment = Comment.new

    set_meta_tags :title => @article.name,
              :description => @article.description,
              :keywords => @article.keywords

    set_meta_tags canonical: "#{request.base_url}/#{@article.category.slug}/#{@article.slug}"
  end

  def comment_create
    @comment = current_user.comments.build(params[:comment].permit(:text, :user_id, :article_id))

    respond_to do |format|
      if @comment.save
        format.html { redirect_to category_article_path(@comment.article.category, @comment.article), notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end  

  def tog
     @article.toggle!(:view)

     redirect_to :back
  end  

  # GET /articles/new
  def new
    set_meta_tags noindex: true

    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
    set_meta_tags noindex: true
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = current_user.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to category_article_path(@article.category, @article), notice: 'Article was successfully created.' }
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
        format.html { redirect_to category_article_path(@article.category, @article), notice: 'Article was successfully updated.' }
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
      params.require(:article).permit(:name, :description, :keywords, :text, :category_id, :user_id, :image, :image_cache, :remove_image, :view, :tag_list, :slug)
    end
end
