class ChangeCorpsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :corps, :name, :string
    add_column :corps, :last_name, :string
    add_column :corps, :first_name, :string
    add_column :corps, :area, :integer, null: false, default: 0
  end
end
