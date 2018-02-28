module Mastermind
	class Board
		attr_accessor :row
		def initialize(input = {})
			@row = input.fetch(:row, default_row)
		end

		def get_cell(x)
			row[x]
		end

		def set_cell(x, value)
			row[x].value = value
		end

		def game_status
			return :winner if winner?
			:status
		end

		def set_hidden_row
			@row = Array.new(4) {Cell.new(int_to_letter[rand(1..6)])}
		end



		

		def default_row
			Array.new(4) {Cell.new}
		end

		def random_numbers
			random_numbers = Array.new(4) {1..6}
		end

		def int_to_letter
			{
				1 => 'Y', 2 => 'B', 3 => 'G',
				4 => 'R', 5 => 'P', 6 => 'O'
			}
		end
	end
end