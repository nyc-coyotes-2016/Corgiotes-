get '/sessions/login' do
  erb :'/sessions/new'
end

post '/sessions' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    status 200
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    status 500
    @errors = ["invalid email or password"]
    erb :'/sessions/new'
  end  
end

get '/sessions/logout' do
  session.clear
  redirect '/'
end
