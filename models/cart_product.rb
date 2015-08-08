class Cart_Product < ActiveRecord::Base
  belongs_to :cart
  belongs_to :product
end


