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
			@row = Array.new(4) {Cell.new(rand(1..6))}

		end







		private

		def default_row
			Array.new(4) {Cell.new}
		end

		def random_numbers
			random_numbers = Array.new(4) {1..6}
		end
	end
end