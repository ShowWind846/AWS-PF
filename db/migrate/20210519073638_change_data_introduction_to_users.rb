class ChangeDataIntroductionToUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :introduction, :string, default: "よろしくお願いします", null: false
  end
end
