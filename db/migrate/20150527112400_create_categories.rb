class CreateCategories < ActiveRecord::Migration
  def change
     create_table :categories do |c|
      c.string :name
      c.timestamp
    end
  end
end
