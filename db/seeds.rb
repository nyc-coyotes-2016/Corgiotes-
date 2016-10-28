User.create(username: "lindzlady", password: "test", email: "lindsay@mail.com")
User.create(username: "jakeeatscake", password: "test", email: "allthecake@mail.com")
User.create(username: "nanutza", password: "test", email: "nanutza@mail.com")
User.create(username: "stumpy", password: "test", email: "stumpy@mail.com")
User.create(username: "corgis4evr", password: "test", email: "corgi@mail.com")

Deck.create(subject: "Corgi Training")
Deck.create(subject: "The Queen's Corgis")
Deck.create(subject: "Wile E. Coyote Trivia")

Card.create(deck_id: 1, question: "True or false: Corgis can do agility training", answer: "true")
Card.create(deck_id: 1, question: "What simple obedience command do most corgis struggle with?", answer: "sit")
Card.create(deck_id: 1, question: "What were corgis bred to do?", answer: "herding")

Card.create(deck_id: 2, question: "How many corgis does The Queen currently have?", answer: "13")
Card.create(deck_id: 2, question: "When did the royal family start keeping corgis?", answer: "1933")
Card.create(deck_id: 2, question: "What was the first royal corgi's name?", answer: "Dookie")

Card.create(deck_id: 3, question: "What year did the first Road Runner/Wile E. Coyote cartoon appear?", answer: "1949")
Card.create(deck_id: 3, question: "Who created Wile E. Coyote?", answer: "Chuck Jones")
Card.create(deck_id: 3, question: "What is Wile E. Coyote's favorite company to order from?", answer: "ACME")

Round.create(user_id: 1, deck_id: 2)

Guess.create(card_id: 4, round_id: 1)
Guess.create(card_id: 5, round_id: 1)
Guess.create(card_id: 5, round_id: 1)
Guess.create(card_id: 6, round_id: 1)
Guess.create(card_id: 6, round_id: 1)
Guess.create(card_id: 6, round_id: 1)
