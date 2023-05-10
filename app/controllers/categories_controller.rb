class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @categories = current_user.categories.all
    @user = current_user
  end
  
  def show
    @category = Category.find(params[:id])
  end

  def new
    @user = current_user
    @category = Category.new
  end

  def create
    @category = Category.new(post_params)
    @category.user = current_user
    if @category.save
      flash.now[:success] = 'Category created!'
      redirect_to categories_path(current_user,@category)
    else
      flash.now[:error] = 'Error: Category not created!'
      redirect_to new_category_path(current_user)
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
  def post_params
    params.require(:category).permit(:name, :icon)
  end
end