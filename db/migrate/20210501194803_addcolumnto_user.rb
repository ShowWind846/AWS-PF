class AddcolumntoUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :area, :string, default: "未設定"
  end
end
