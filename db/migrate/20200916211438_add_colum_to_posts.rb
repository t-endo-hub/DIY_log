class AddColumToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :sales_status, :integer, default: 1
  end
end
