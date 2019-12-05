class CreateLifts < ActiveRecord::Migration[6.0]
  def change
    create_table :lifts do |t|
      t.string :lift_name
      t.string :category
      t.integer :prim_mg
      t.integer :sec_mg
      t.integer :def_sets
      t.integer :def_reps
      t.string :image

      t.timestamps
    end
  end
end
