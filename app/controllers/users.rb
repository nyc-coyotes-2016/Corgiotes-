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
  @sorted_rounds = {}
  @rounds = @user.rounds.order('deck_id').order('created_at')
  deck_names = @user.played_decks.pluck(:subject).uniq!
  deck_names.each do |deck|
    @sorted_rounds[deck] = []
  end

  @rounds.each do |round|
    @sorted_rounds.each do |deck_name, rounds|
      if deck_name == round.deck.subject
        rounds << round
    end
  end
end
  erb :'/users/show'
end
