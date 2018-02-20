module Mastermind
	class Big_board

		def initialize(hidder_row = Row.new, grid = Row.new)
			@grid = grid
			@hidden_row = hidden_row.set_hidden_row
		end

		def add_row
			
