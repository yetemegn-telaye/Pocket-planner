class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :budget_logs
  validates :name, presence: true
  validates :icon, presence: true

  def total_spent
    budget_logs.sum(:amount)
  end
end
