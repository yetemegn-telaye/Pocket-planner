class Category < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :icon, presence: true

  def total_spent
    budget_logs.sum(:amount)
  end
end
