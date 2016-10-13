require 'sinatra'
require_relative "new_tic_tac.rb"
require_relative "sequentialAI.rb"
require_relative "unbeatable.rb"
require_relative "randomAI.rb"
require_relative "console_game.rb"
require_relative "human.rb"
enable :sessions
board = Board.new
#players = Current_player.new
get '/' do
    erb :index
end
post "/output" do
    session[:board] = Board.new
    player_1 = params[:player_1]
    player_2 = params[:player_2]
    if player_1 == "human"
        session[:p1] = Human.new("X") 
    elsif player_1 == "sequential_ai"
        session[:p1] = SequentialAI.new("X")  
    else player_1 == "random_ai"
        session[:p1] = RandomAI.new("X")  
    end
    if player_2 == "human"
        session[:p2] = Human.new("O")
    elsif player_2 == "sequential_ai"
        session[:p2] = SequentialAI.new("O")  
    else player_2 == "random_ai"
        session[:p2] = RandomAI.new("O")  
    end
    session[:current_player] = session[:p1]
    erb :game, :locals => {:current_player => session[:current_player], :player_1 => session[:p1], :player_2 => session[:p2], :board => session[:board].ttt_board, :message =>" "}
end
get '/game' do
    session[:board] = Board.new
    erb :game, :locals => {:board => session[:board].ttt_board, :message =>"player one pick a space."}
    
end
post '/game' do
    spot = params[:choice].to_i
    marker = session[:current_player].marker
    session[:board].update_board(spot - 1, marker) 
    erb :game, :locals => {:board => session[:board].ttt_board, :message =>" "}
    
end

get "/get_move" do

	erb :game

end



post "/get_player_move" do

	# if session[:current_player] == ConsoleA

		move_spot = params[:move_spot].to_i

	# else session[:current_player] == SequentialAI.new

	# 	move_spot = session[:current_player].get_move.to_i

	# end



	session[:board].update_board((move_spot - 1), session[:current_player].marker)

	if session[:board].game_won?(session[:current_player].marker) == true
		
		redirect "/win?current_player=session[:current_player]"

	elsif session[:board].game_ends_in_tie? == true

		redirect "/tie"

	else

		if session[:current_player].marker == "X"

			session[:current_player] = session[:p2]

		else

			session[:current_player] = session[:p1]

		end

		

		erb :game, :locals => {:current_player => session[:current_player], :player_1 => session[:p1], :player_2 => session[:p2], :board => session[:board].board_with_positions}



	end
end
get "/win" do
	
	"#{session[:current_player].marker} is the WINNER"
end

get "/tie" do

	"The game is a TIE"

end

