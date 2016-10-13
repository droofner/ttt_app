require_relative "ttt_functions.rb"

array = [1, 2, 3, 4, 5, 6, 7, 8, 9]

tic_tac_toe(array)

ask_to_play_game()

player_one = player_1_marker()

player_two = player_2_marker(player_one)

choose_space_to_play(array)