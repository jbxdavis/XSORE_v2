class AddCommentString < ActiveRecord::Migration[6.0]
  def change
    add_column :executions, :comment, :string
  end
end
