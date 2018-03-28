class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    if @category = Category.create(category_params)
      flash[:success] = "#{@category.name} Category Added!"
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def update
    flash[:success] = 'Category Updated!' if @category.update(category_params)
    redirect_to categories_path
  end

  def destroy
    flash[:success] = 'Category Deleted!' if @category.destroy
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
