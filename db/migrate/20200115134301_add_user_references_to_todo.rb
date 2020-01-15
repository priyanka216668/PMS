class AddUserReferencesToTodo < ActiveRecord::Migration[5.2]
  def change
    add_reference :todos, :assigned_to, foreign_key: { to_table: :users }
    add_reference :todos, :created_by, foreign_key: { to_table: :users }
  end
end
