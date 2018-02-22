module Mastermind
	class Big_board
		attr_accessor :grid, :hidden_row

		def initialize(hidden_row = Board.new, grid = Array.new)
			@grid = grid
			@hidden_row = hidden_row
			@hidden_row.set_hidden_row
			@colors = Array.new
			@colors  = ["Y", "B", "G", "R", "P", "O"]
		end

		def add_row(row)
			@grid << row
		end

		def print_status
			i = 0
			while i < grid.length
				print_row_status(i)
				i += 1
			end
			message
		end

		def game_status
			status = []
			grid.collect do |row|
				hidden = hidden_row.clone
				status << row_status(hidden, row)
			end
			status
		end

		def print_row_status(i)
			red = game_status[i][0]
			white = game_status[i][1]
			message = "#{grid[i]} -> #{red} na swoim miejscu i #{white} nie na swoim miejscu" 
		end


		def row_status(hidden, row)
			red = correct_position(hidden, row)
			white = correct_color(hidden, row)
			[red, white]
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

