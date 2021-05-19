class AddColumnToCorp < ActiveRecord::Migration[5.2]
  def up
    change_column :corps, :introduction, :string, default: "よろしくお願いします。"
  end

  def down
    change_column :corps, :introduction, :string
  end
end
