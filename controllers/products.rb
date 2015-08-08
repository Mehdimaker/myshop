#JSON
get '/products.json' do
  content_type :json
  @product = Product.all
  @product.to_json
end

post '/products/add' do
  Product.create(name: params[:name],price: params[:price], stock: params[:stock],shipping_cost: params[:shipping_cost])
  redirect '/'
end

post '/products/edit' do
  @products.each do |product|
    product.name = params[:"#{product.id}name"] if params[:"#{product.id}name"] 
    product.price = params[:"#{product.id}price"] if params[:"#{product.id}price"] 
    product.stock = params[:"#{product.id}stock"] if params[:"#{product.id}stock"] 
    product.shipping_cost = params[:"#{product.id}shipping_cost"] if params[:"#{product.id}shipping_cost"] 
    product.save
  end
  redirect '/'
end

post '/products/delete' do
  @products.each do |product|
    if params[:"#{product.id}"] != nil
      Product.find(params[:"#{product.id}"]).destroy
    end
  end
  redirect '/'
end


