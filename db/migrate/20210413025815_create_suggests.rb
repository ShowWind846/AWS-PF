class CreateSuggests < ActiveRecord::Migration[5.2]
  def change
    create_table :suggests do |t|

      t.timestamps
    end
  end
end
