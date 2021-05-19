class ChangeDataIntroductionToCorps < ActiveRecord::Migration[5.2]
  def change
    change_column :corps, :introduction, :string, default: "よろしくお願いします", null: false
  end
end
