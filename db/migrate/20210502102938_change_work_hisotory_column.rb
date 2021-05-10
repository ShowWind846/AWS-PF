class ChangeWorkHisotoryColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :work_histroy, :integer
    add_column :users, :work_history, :integer, default: 0, null: false
  end
end
