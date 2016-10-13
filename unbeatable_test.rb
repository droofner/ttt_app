require "minitest/autorun"
require_relative "unbeatable.rb"

class TestUnbeatable < Minitest::Test

	def test_for_creating_player
		player = Unbeatable.new("X")
		assert_equal("X", player.marker)
	end

	
	
	def test_win_spot_for_O
        player = Unbeatable.new("O")
        assert_equal(3, player.get_move([" ","X","X"," ","O","O"," "," "," "]))
        assert_equal(8, player.get_move(["O","X","O","X","O","X","X","O"," "]))
		assert_equal(7, player.get_move(["X","O","X","X","O"," "," "," ","X"]))
    end

	


end