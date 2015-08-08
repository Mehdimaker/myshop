class AddShippingCost < ActiveRecord::Migration
  def change
	add_column :products, :shipping_cost, :integer
  end
end
