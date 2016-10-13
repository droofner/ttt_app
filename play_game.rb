require_relative "console_game.rb"

p1 = Unbeatable.new("X")
p2 = Unbeatable.new("O")
game = ConsoleGame.new(p1, p2)

game.start_game()
game.board_status()
until game.board.game_won?(game.current_player.marker) || game.board.game_ends_in_tie?()
	game.change_player
	move = game.get_player_move
	game.make_move(move)
	game.board_status
end
if game.board.game_won?(game.current_player.marker) 
	puts "#{game.current_player.marker} WINS!"
else game.board.game_ends_in_tie?()
	puts "DRAW!!"
end