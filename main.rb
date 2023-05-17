require_relative 'players'
require_relative 'turn'

# initiliaze all the players in the game
player1 = Player.new("P-1")
player2 = Player.new("P-2")

# begin the game
game_over = false
current_player = player1

while !game_over
  turn = Turn.new(current_player)
  turn.ask_question

  if turn.correct_answer?
    puts "That answer is correct #{current_player.name}!\n----------------"
  else
    puts "Sorry, #{current_player.name}, that answer is incorrect..\n----------------"
    current_player.lose_life

    if current_player.lives == 0
      game_over = true
      puts "#{current_player.name} has run out of lives. Game over!\n----------------"
    else
      puts "#{current_player.name} has #{current_player.lives} lives remaining.\n----------------"
    end
  end

  # switch between the players
  current_player = (current_player == player1) ? player2 : player1
end