class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      # 外部キー制約つけているとnilが認められないため、付けられない？
      # ルームのnilはあり得ないので外部キー制約付ける
      t.references :user
      t.references :corp
      t.references :room
      t.text :message
      t.timestamps
    end

    add_foreign_key :messages, :rooms, on_delete: :cascade
  end
end
