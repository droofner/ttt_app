class Unbeatable

	attr_reader :marker

	def initialize(marker)
		@marker = marker
	end

	def get_move(board)
		if possible_wins(board) <= 8
            move = possible_wins(board)
        elsif possible_blocks(board) <=8
            move = possible_blocks(board)
        else
            board = board.index(" ")
        end 
	end
	
	def possible_wins(ttt_board)
		winning_combinations = [[ttt_board[0],ttt_board[1],ttt_board[2]],
                        	    [ttt_board[3],ttt_board[4],ttt_board[5]],
                        		[ttt_board[6],ttt_board[7],ttt_board[8]],
                        		[ttt_board[0],ttt_board[3],ttt_board[6]],
                        		[ttt_board[1],ttt_board[4],ttt_board[7]],
                        		[ttt_board[2],ttt_board[5],ttt_board[8]],
                        		[ttt_board[0],ttt_board[4],ttt_board[8]],
                        		[ttt_board[2],ttt_board[4],ttt_board[6]]]

    winning_position = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]                    
    open_spot = 10

        winning_combinations.each_with_index do |winner, index|
        	if winner.count(marker) == 2 && winner.count(" ") == 1
        		winning_player = winner.index(" ")
        		i = index
          		open_spot = winning_position[i][winning_player]  			
      	 	end
        end
        open_spot
    end


    def possible_blocks(board)
        blocking_combinations = [[board[0],board[1],board[2]],
                                [board[3],board[4],board[5]],
                                [board[6],board[7],board[8]],
                                [board[0],board[3],board[6]],
                                [board[1],board[4],board[7]],
                                [board[2],board[5],board[8]],
                                [board[0],board[4],board[8]],
                                [board[2],board[4],board[6]]]

    blocking_position = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]                    
        
        if marker == "X"
            rival_marker = "O"
        else
            rival_marker = "X"
        end    

    open_spot = 10

        blocking_combinations.each_with_index do |foe, index|
            if foe.count(rival_marker) == 2 && foe.count(" ") == 1
                rival = foe.index(" ")
                i = index
                open_spot = blocking_position[i][rival]             
            end
        end
        open_spot
    end
end

