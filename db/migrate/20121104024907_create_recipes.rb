class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :user_id
      t.string :prep_time
      t.string :cook_time
      t.integer :servings
      t.text :method

      t.timestamps
    end
    add_index :recipes, :name
    add_index :recipes, [:user_id, :name]
  end
end
