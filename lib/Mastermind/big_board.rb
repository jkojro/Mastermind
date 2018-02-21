module Mastermind
	class Big_board
		attr_reader :grid, :hidden_row

		def initialize(hidden_row = Board.new, grid = Array.new(1) {Board.new})
			@grid = grid
			@hidden_row = hidden_row
			@hidden_row.set_hidden_row
			@colors = Array.new
			@colors  = ["Y", "B", "G", "R"]
		end

		def add_row
			@grid << Board.new
		end

		def row_status(hidden, row)
			#status = Array.new
			#grid.map do |row|
				#hidden = hidden_row.clone
				red = correct_position(hidden, row)
				white = correct_color(hidden, row)
				#status << 
				[red, white]
			#end
		end

		def game_over
			return :winner if winner?
			return :game_status if !winner?
		end




		def winner?
			hidden_row == grid.last
		end

		def correct_position(hidden, row)
			red = 0
			(0..3).each do |index|
				if hidden[index] == row[index]
					red += 1
					hidden[index] = "X"
					row[index] = "X"
				end
			end
			red
		end

		def correct_color(hidden, row)
			white = 0
			@colors.each do |color|
				white += [hidden.count(color), row.count(color)].min
			end
			white
		end
	end
end

