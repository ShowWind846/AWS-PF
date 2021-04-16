class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: { to_table: :corps}
      t.references :corp, foreign_key: { to_table: :users}

      t.timestamps
      
      t.index [:user_id,:corp_id], unique: true
    end
  end
end
