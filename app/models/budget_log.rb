class BudgetLog < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  validates :amount, presence: true, numericality: { greater_than: 0, only_integer: true }
  validates :name, presence: true
  validates :categories, presence: true
end
