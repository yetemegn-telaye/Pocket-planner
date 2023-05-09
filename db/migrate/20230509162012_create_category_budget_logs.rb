class CreateCategoryBudgetLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :category_budget_logs do |t|
      t.references :category, null: false, foreign_key: true
      t.references :budget_log, null: false, foreign_key: true

      t.timestamps
    end
  end
end
