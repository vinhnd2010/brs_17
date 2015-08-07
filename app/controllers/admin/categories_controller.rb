class Admin::CategoriesController < ApplicationController
  before_action :load_category, except: [:index, :new, :create]
  before_action :verify_admin

  def index
    @categories = Category.latest.paginate page: params[:page],
      per_page: Settings.category.per_page
  end

  def show
    @books = @category.books
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "flash.category.created.success"
      redirect_to [:admin, @category]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update category_params
      flash[:success] = t "flash.category.updated.success"
      redirect_to [:admin, @category]
    else
      render "edit"
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t("flash.category.deleted.success")
    else
      flash[:failed] = t("flash.category.delete.failed")
    end
    redirect_to admin_root_path
  end

  private
  def load_category
    @category = Category.friendly.find params[:id]
  end

  def category_params
    params.require(:category).permit :name, :description
  end
end
