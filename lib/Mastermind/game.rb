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

		

		def play
			puts "hidden_row: #{big_board.hidden_row.to_s}"
			an = "y"
			while an == "y"

				puts info
				move = get_move
				big_board.add_row(move)
				

				big_board.print_status

				puts "Dalej?"
				an = gets.chomp
			end
		end
	end
end

