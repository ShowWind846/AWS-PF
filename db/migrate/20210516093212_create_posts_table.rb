class CreatePostsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :post_image_id
      t.string :title
      t.text :contents
      t.integer :category, default: 0, null: false
      t.timestamps
    end
  end
end
