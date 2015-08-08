require 'sinatra'
require "sinatra/activerecord"
require 'slim'
require 'require_all'
require 'json'
require 'shotgun'
require 'bcrypt'

enable :sessions
require_all 'controllers'
require_all 'models'

before do
  @products = Product.all
  @cart_products = Cart_Product.all
  @carts = Cart.all
  @users = User.all

  if session[:user_id]
    @current_user = User.find(session[:user_id])
    @current_cart = Cart.find_by(status: "en cours", user_id: @current_user.id)
    @current_products = Cart_Product.where(cart_id: @current_cart.id)
    
 
  elsif session[:user_id] == nil
    @current_user = nil
    @current_cart = nil
  end
end

get '/' do
  if @current_user && @current_user.role == "admin"
    slim :admin
  elsif @current_user && @current_user.role == "user"
    slim :user
  else
    slim :index
  end
end

#get '/admin' do
#  if @current_user.name == "admintest"
#    slim :admin
#  else
#   redirect '/'
#  end
#end


