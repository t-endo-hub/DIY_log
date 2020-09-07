class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :post, foreign_key: true, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
