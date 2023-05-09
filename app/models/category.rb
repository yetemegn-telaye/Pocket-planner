class Category < ApplicationRecord
    belongs_to :user
    has_many :category_budget_logs, dependent: :destroy
    has_many :budget_logs, through: :category_budget_logs
end
