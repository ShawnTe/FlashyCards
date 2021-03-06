get '/sessions/new' do
  erb :'/sessions/new'
end


post '/sessions/new' do

  @user = User.find_by(email: params["email"])

  if @user && @user.password == params["password"]
    session[:user_id] = @user.id
    redirect "/decks"

  else
    @error = "Couldn't log in"
    erb :'/sessions/new'
  end

end

get '/sessions/delete' do
  session[:user_id] = nil
  redirect '/'
end