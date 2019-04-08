class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.create(get_params)
    redirect_to category_path(category)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(get_params)
    redirect_to category_path(category)
  end

  private

  def get_params
    params.require(:category).permit(:name)
  end
end
