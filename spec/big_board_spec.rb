require "spec_helper"

module Mastermind
	describe Big_board do 

		context "#initialize" do

			it "creates a hidden_row that is an instance of a Board class" do
				big_board = Big_board.new
				expect(big_board.hidden_row).to be_an_instance_of(Board)
			end

			it "creates a grid that is an Array" do
				big_board = Big_board.new
				expect(big_board.grid).to be_an_instance_of(Array)
			end

			it "creates an empty grid" do
				big_board = Big_board.new
				grid = big_board.grid
				expect(grid).to have(0).thing
			end

			it "creates a hidden_row of random 1-6 numbers" do
				big_board = Big_board.new
				hidden_row = big_board.hidden_row
				expect("YBGRPO").to include(hidden_row.get_cell(1).value)
			end
		end


		let(:hidden) {["Y", "B", "B", "R"]}
		let(:row) {["Y", "B", "R", "G"]}
		let(:grid) {[["Y", "B", "R", "G"], ["Y", "G", "G", "B"], ["R", "B", "R", "Y"]]}

		context "#add_row" do
			it "adds a row to the grid" do
				big_board = Big_board.new
				row1 = ["Y", "G", "G", "B"]
				new_grid = big_board.add_row(row1)
				expect(new_grid).to have(1).things
			end
		end

		context "#row_status" do
			it "counts red and white" do
				big_board = Big_board.new
				expect(big_board.row_status(hidden, row)).to eq [2, 1]
			end
		end

		context "#big_board" do
			it "grid" do
				big_board = Big_board.new
				#big_board.grid = [["Y", "B", "R", "G"]]
				row2 = ["Y", "G", "G", "B"]
				grid2 = big_board.add_row(row2)
				expect(big_board.grid.last).to eq(["Y", "G", "G", "B"])
			end

			it "hidden_row" do
				big_board = Big_board.new
				big_board.hidden_row = ["Y", "B", "B", "R"]
				big_board.grid = ([["Y", "B", "R", "G"], ["Y", "G", "G", "B"], ["R", "B", "R", "Y"]])
				expect(big_board.hidden_row).to eq(["Y", "B", "B", "R"])
			end

			it "game_status" do
				big_board = Big_board.new
				big_board.hidden_row = ["Y", "B", "B", "R"]
				big_board.grid = ([["Y", "B", "R", "G"], ["Y", "G", "G", "B"], ["R", "B", "R", "Y"]])
				expect(big_board.game_status).to eq([[2, 1], [1, 1], [1, 2]])
			end

			it "game_status with added rows" do
				big_board = Big_board.new
				big_board.hidden_row = ["Y", "B", "B", "R"]
				row1 = ["Y", "B", "R", "G"]
				row2 = ["Y", "G", "G", "B"]
				row3 = ["R", "B", "R", "Y"]
				big_board.add_row(row1)
				big_board.add_row(row2)
				big_board.add_row(row3)
				expect(big_board.game_status).to eq([[2, 1], [1, 1], [1, 2]])
			end
		end

		context "#print_row_status" do
			it "counts correct positions and colors" do
				big_board = Big_board.new
				row1 = ["A", "A", "A", "A"]
				row2 = ["Y", "G", "G", "B"]
				row3 = ["Y", "R", "R", "B"]
				big_board.add_row(row1)
				big_board.add_row(row2)
				red1 = big_board.row_status(hidden, row1)
				red2 = big_board.row_status(hidden, row2)
				red3 = big_board.row_status(hidden, row3)
				expect(red1).to eq [0, 0]
				expect(red2).to eq [1, 1]
				expect(red3).to eq [1, 2]
			end

			it "prints one row's moves and it's status" do
				big_board = Big_board.new
				#big_board.hidden_row = ["Y", "B", "B", "R"]
				row1 = ["A", "A", "A", "A"]
				row2 = ["Y", "G", "G", "B"]
				big_board.add_row(row1)
				big_board.add_row(row2)
				expected1 = '["A", "A", "A", "A"] -> 0 na swoim miejscu i 0 nie na swoim miejscu'
				expect(big_board.print_row_status(hidden, row1)).to eq expected1
				expected2 = '["Y", "G", "G", "B"] -> 1 na swoim miejscu i 1 nie na swoim miejscu'
				expect(big_board.print_row_status(hidden, row2)).to eq expected2
			end
		end

		context "#prist game status" do
			it "print all rows moves and their status" do
				big_board = Big_board.new
				#big_board.hidden_row = ["Y", "B", "B", "R"]
				row1 = ["A", "A", "A", "A"]
				row2 = ["Y", "G", "G", "B"]
				big_board.add_row(row1)
				big_board.add_row(row2)

			end
		end

	end
end