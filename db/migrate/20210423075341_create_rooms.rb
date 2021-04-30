class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.references :relationship
      t.timestamps
    end

    add_foreign_key :rooms, :relationships, on_delete: :cascade
  end
end
