get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/:deck_id' do
  @deck = Deck.find_by(id: params[:deck_id])
  @round = Round.new(user_id: current_user.id, deck_id: @deck.id).save unless @round
  @cards = []
  @deck.cards.each do |card|
    @cards << card unless card.guessed_correctly == 0
  end
  @card = @cards.sample
  erb :'decks/show'
end

post '/decks' do
  @answer = params[:answer]
  @deck_id = params[:deck_id]
  @round = Round.last
  card = Card.find_by(answer: params[:answer])
  binding.pry
  guess = Guess.new(round_id: @round.id, card_id: card.id)
  if @answer == card.answer
    card.guessed_correctly = 1
    card.update_attributes(params[:guessed_correctly])
    puts "Correct!"
  else
    puts "Did not see answer"
    puts params
  end
  redirect "/decks/#{@deck_id}"
end
