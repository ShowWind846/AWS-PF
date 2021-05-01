class AddColumnToCorp < ActiveRecord::Migration[5.2]
  def up
    change_column :corps, :introduction, :text, default: "よろしくお願いします。"
  end

  def down
    change_column :corps, :introduction, :text
  end
end
