class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.references :post, foreign_key: true, null: false
      t.string :name, null: false
      t.string :quantity, null: false

      t.timestamps
    end
  end
end
