class BudgetLog < ApplicationRecord
    belongs_to :user
    has_many :category_budget_logs, dependent: :destroy
    has_many :categories, through: :category_budget_logs
end
