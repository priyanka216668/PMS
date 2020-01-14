class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title
      t.string :type
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
