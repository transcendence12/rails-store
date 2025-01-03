class AddInventoryCountToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :inventory_count, :integer, default: 0
  end
end
