module Mastermind
	class Big_board
		attr_accessor :grid, :hidden_row

		def initialize
			@grid = Array.new
			@hidden_row = Board.new
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
				puts print_row_status(i)
				i += 1
			end
			#message
		end

		def print_game_status
			grid.collect do |row|
				puts print_row_status(row)

			end
		end

		def print_row_status(row)
			row_status = row_status(hidden_row, row)
			red = row_status[0]
			white = row_status[1]
			message = "#{row} -> #{red} na swoim miejscu i #{white} nie na swoim miejscu" 
		end


		def game_over?
			hidden_row == grid.last
		end

		def winner?
		end

		def row_status(hidden, row)
			red = 0
			(0..3).each do |index|
				if hidden.row[index].value == row[index]
					red += 1
				end
			end
			white_and_red = 0
			@colors.each do |color|
				white_and_red += [hidden.row.count { |cell| cell.value == color}, row.count(color)].min
			end
			white = white_and_red - red
			[red, white]
		end

		def print_hidden_row
			puts "hidden_row:"
			hidden_row.row.each do |cell|
				puts cell.value
			end
		end
	end
end

