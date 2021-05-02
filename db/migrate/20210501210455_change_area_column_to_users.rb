class ChangeAreaColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :area, :string
    add_column :users, :area, :integer, null: false, default: 0
  end
end
