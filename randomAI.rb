class RandomAI

	attr_accessor :marker

	def initialize(marker)
		@marker = marker
	end
	
	# def get_move(board)
	# 	board.index(" ")
	# end

	def get_move(board, marker)

		move = []
		i = 0
		board.each do  |board_spot|

			if board_spot == " "
				move.push(i+1)
			end
			i = i + 1
		end
		move.sample
	end

	# def random_space(board)
	# 	board.sample(" ")
	# end

	def array
		#create an array of
		array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
	end
end	

