class AddNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :discription, :text
    add_column :users, :address, :string
    add_column :users, :posta_code, :string

  end
end
