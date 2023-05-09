class BudgetLog < ApplicationRecord
  belongs_to :user
  has_many :category_budget_logs, dependent: :destroy
  has_many :categories, through: :category_budget_logs
  validates :amount, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :name, presence: true
  validates :categories, presence: true
end
