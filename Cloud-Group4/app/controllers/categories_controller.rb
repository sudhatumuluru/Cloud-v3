class CategoriesController < ApplicationController
  
  def index
    @categories = current_user.categories
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    @category.save
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update_attributes(category_params)
  end

  def destroy
      @category = Category.find(params[:id])
      @category.destroy
  end

  private
  def category_params
    params[:category].permit(:name)
  end
  
end
