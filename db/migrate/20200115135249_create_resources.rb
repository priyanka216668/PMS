class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.boolean :is_active_user
      t.belongs_to :project
      t.belongs_to :user


      t.timestamps
    end
  end
end
