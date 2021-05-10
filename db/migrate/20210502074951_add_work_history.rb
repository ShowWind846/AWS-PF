class AddWorkHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :work_histroy, :integer, default: 0, null: false
  end
end
