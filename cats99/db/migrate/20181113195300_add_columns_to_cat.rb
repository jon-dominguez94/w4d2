class AddColumnsToCat < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :birth_date, :date
    add_column :cats, :color, :string
    change_column :cats, :name, :string, null: false
    add_column :cats, :sex, :string, limit: 1
    add_column :cats, :description, :text
    add_index :cats, :name
  end
end
