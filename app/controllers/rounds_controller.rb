get '/decks' do
  @decks = Deck.all
  erb :'decks/index'
end

get '/decks/:deck_id' do
  @deck = Deck.find_by(id: params[:deck_id])
  @cards = @deck.cards
  @card = @cards.sample
  # binding.pry
  erb :'decks/show'
end

post '/decks' do
  @answer = params[:answer]
  @deck_id = params[:deck_id]
  card = Card.find_by(answer: params[:answer])
  if @answer == card.answer
    puts "Correct!"
    
  else
    puts "Did not see answer"
    puts params
  end
  redirect "/decks/#{@deck_id}"
end
