class AddCoulmnToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :name, :string
    add_column :projects, :description, :string
  end
end
