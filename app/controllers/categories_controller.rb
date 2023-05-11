class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = current_user.categories.includes(:budget_logs)
    @distinct_logs = current_user.budget_logs.joins(:categories).distinct
    @total_spent = @distinct_logs.map(&:amount).sum
  end

  def show
    @category = current_user.categories.includes(:budget_logs).find(params[:id])
    @budget_logs = @category.budget_logs.order(created_at: :desc)
    @total = @budget_logs.map(&:amount).sum
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      flash.now[:success] = 'Category created!'
      redirect_to categories_path
    else
      flash.now[:error] = 'Error: Category not created!'
      redirect_to new_category_path
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
