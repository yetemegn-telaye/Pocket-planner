require 'rails_helper'


RSpec.describe BudgetLog, type: :model do
    let(:user) { User.create!(fullname: 'Mia', email: 'mia@gmail.com', password: '123456') }
    let(:category) { Category.create!(user:, name: 'Groceries', icon: '🛒') }
    let(:budget_log) {BudgetLog.create!(user: user, name: 'Bannana', amount: 10, categories: [category]) }
  
    describe 'validations' do
      it 'should not valid if name is not present' do
        budget_log.name = nil
        expect(budget_log).to_not be_valid
      end
  
      it 'should not valid if amount is not present' do
        budget_log.amount = nil
        expect(budget_log).to_not be_valid
      end
  
      it 'should not valid if amount is negative' do
        budget_log.amount = -100
        expect(budget_log).to_not be_valid
      end
    end
  
    describe 'associations' do
      it 'should include at least one category' do
        expect(budget_log.categories).to include(category)
      end
    end
  end