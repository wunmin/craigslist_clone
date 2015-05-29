class CreatePosts < ActiveRecord::Migration
  def change
     create_table :posts do |post|
      post.string :title
      post.string :email
      post.string :price
      post.text :description
      post.integer :category_id
      post.datetime :created_at
      post.datetime :updated_at
    end
  end
end
