post '/cart_product/add' do
  Cart_Product.create(product_id: params[:product_id], cart_id: @current_cart.id, quantity: params[:quantity])
  redirect '/'
end