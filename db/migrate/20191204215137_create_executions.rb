class CreateExecutions < ActiveRecord::Migration[6.0]
  def change
    create_table :executions do |t|
      t.date :date
      t.integer :user_id
      t.integer :lift_id
      t.integer :sets
      t.integer :reps
      t.integer :weight

      t.timestamps
    end
  end
end
