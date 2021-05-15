class AddColumnToNotificationTables < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :visited_corp_id ,:integer
    add_column :notifications, :visitor_user_id ,:integer
    add_index :notifications, :visited_corp_id
    add_index :notifications, :visitor_user_id
  end
end
