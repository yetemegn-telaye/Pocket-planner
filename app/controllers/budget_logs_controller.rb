class BudgetLogsController < ApplicationController
  before_action :authenticate_user!

  # GET /budget_logs
  # GET /budget_logs.json

  def new
    @categories = current_user.categories
    @category = @categories.select { |i| i.id == params[:category_id].to_i }[0]
    @budget_log = BudgetLog.new
  end

  def create
    @category = Category.find(params[:category_id])
    @budget_log = BudgetLog.new(budget_params)
    @budget_log.user = current_user

    if @budget_log.save
      flash.now[:success] = 'Transaction created successfully!'
      redirect_to category_path(@category)
    else
      flash.now[:error] = 'Error: BudgetLog not created!'
      redirect_to new_category_budget_log_path(@category)
    end
  end

  private

  def budget_params
    params.require(:budget_log).permit(:name, :amount, category_ids: [])
  end
end
