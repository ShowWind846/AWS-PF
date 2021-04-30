class ChangeNotificationTableColumns < ActiveRecord::Migration[5.2]
  def change

    add_index :notifications, :visitor_id
    add_index :notifications, :visited_id
  end
end
