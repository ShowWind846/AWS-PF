class ChangeRelationshipTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :relationships, :user_id, :integer
    remove_column :relationships, :corp_id, :integer
    add_reference :relationships, :user, foreing_key: true, null: :false
    add_reference :relationships, :corp, foreign_key: true, null: :false
  end
end
