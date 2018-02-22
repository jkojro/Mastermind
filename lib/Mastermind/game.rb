module Mastermind
	class Game
		attr_reader :big_board
		def initialize(big_board = Big_board.new)
			@big_board = big_board
		end

		def info
			"Wprowadź 4 strzały spośród kolorów: Y B G R P O, np. BOPG"
		end

		def get_move(raw_move = gets)
			move = raw_move.split(//)
		end

		def print_status
			i = 0
			while i < big_board.grid.length
				puts big_board.grid[i]
				puts "#{big_board.game_status[i, 0]} na swoim miejscu i #{big_board.game_status[i, 1]} nie na swoim miejscu"
				i += 1
			end
		end

	end
end

