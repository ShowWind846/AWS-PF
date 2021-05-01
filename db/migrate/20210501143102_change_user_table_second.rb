class ChangeUserTableSecond < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_image_id, :string
    add_column :users, :introduction, :text, default: "よろしくお願いします。"
    add_column :users, :company, :string
  end
end
