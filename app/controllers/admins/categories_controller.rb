class Admins::CategoriesController < ApplicationController
  before_action :set_category, only: %i[edit update destroy]
  
  def index
    @category = Category.new
    @categories = Category.all
  end

  
  def edit
  end
  
  def update
  end
  
  def create
    @category = Category.create(category_params)
    redirect_to request.referer
  end

  def destroy
    @category.destroy
    redirect_to request.referer
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
