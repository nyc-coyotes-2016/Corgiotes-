get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save && user.password == params[:password_confirmation]
    status 200
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    status 500
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'/users/show'
end
