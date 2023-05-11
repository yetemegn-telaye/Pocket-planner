class BudgetLog < ApplicationRecord
  belongs_to :user
  validates :amount, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :name, presence: true
  validates :categories, presence: true
end
