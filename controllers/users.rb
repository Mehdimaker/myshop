post '/signin' do
  user = User.where(name: params[:name]).first

   if user && user.authenticate(params[:password])
    session[:user_id] = user.id
     redirect '/'
  else
    session[:user_id] = nil
     redirect '/'
  end
 



end

post '/signup' do
  #Création de l'user
  user = User.create(name: params[:name],password: params[:password],role: "user")
  session[:user_id] = user.id
  #Création du panier
  Cart.create(user_id: user.id, status: "en cours")

  redirect '/'
end

post '/logout' do
   session[:user_id] = nil
  redirect '/'
end


post '/editprofile' do
    user = User.find(@current_user.id)
    user.name = params[:name] 
    user.save
  redirect '/'
end

