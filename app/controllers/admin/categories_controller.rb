class Admin::CategoriesController < Admin::BaseController
  cache_sweeper :blog_sweeper

  def index
     redirect_to :action => 'edit'
  end
  
  def edit
    @category_id = params[:id]
    respond_to do |format|
      format.html { new_or_edit }
      format.js { 
        @category = Category.new
      }
    end
  end

  def new 
    edit
  end

  def destroy
    @record = Category.find(params[:id])
    return(render 'admin/shared/destroy') unless request.post?

    @record.destroy
    redirect_to :action => 'edit'
  end

  private

  def new_or_edit
    @categories = Category.find(:all)
    params[:id] ? @category = Category.find(params[:id]) : nil
    if request.post?
      respond_to do |format|
        format.html { save_category }
        format.js do 
          @category.save
          @article = Article.new
          @article.categories << @category
          return render(:partial => 'admin/content/categories')
        end
      end
      return
    end
    render 'new'
  end

  def save_category
    @category ? @category.update_attributes(params[:category]) : @category=Category.new(params[:category])
    if @category.save!
      flash[:notice] = _('Category was successfully saved.')
    else
      flash[:error] = _('Category could not be saved.')
    end
    redirect_to :action => 'edit'
  end

end
