class AddColumnToCorps < ActiveRecord::Migration[5.2]
  def change
    add_column :corps, :introduction, :text
    add_column :corps, :profile_image_id, :string
    add_column :corps, :name, :string
  end
end