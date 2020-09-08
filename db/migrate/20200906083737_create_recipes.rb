class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.references :post, foreign_key: true, null: false
      t.string :image_id
      t.text :content, null: false
      t.timestamps
    end
  end
end
