require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create!(fullname: 'Mia', email: 'mia@gmail.com', password: '123456') }
  let(:category) { Category.create!(user:, name: 'Groceries', icon: '🛒') }
  let(:budget_log) { BudgetLog.create!(user:, name: 'Bannana', amount: 10, categories: [category]) }

  describe 'validations' do
    it 'Should be valid with valid attributes' do
      expect(category).to be_valid
    end

    it 'Should not be valid without a name' do
      category.name = nil
      expect(category).to_not be_valid
    end
    it 'Should not be valid without an icon' do
      category.icon = nil
      expect(category).to_not be_valid
    end
  end
  describe 'associations' do
    it 'Should belong to correct user' do
      expect(category.user).to eq(user)
    end
    it 'Should have many budget logs' do
      expect(category.budget_logs).to include(budget_log)
    end
  end
end
