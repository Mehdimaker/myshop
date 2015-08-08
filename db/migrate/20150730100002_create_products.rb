class CreateProducts < ActiveRecord::Migration
  def change
  	create_table :products do |t|
      t.string :name
 			t.integer :price
    	t.integer :stock
    end
  end
end