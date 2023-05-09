class CategoryBudgetLog < ApplicationRecord
  belongs_to :category
  belongs_to :budget_log
end
