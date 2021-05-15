class AddMessageIdColumnToNotificationTable < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :message_id, :integer
    add_index :notifications, :message_id
  end
end
