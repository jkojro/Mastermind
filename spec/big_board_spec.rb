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

			it "creates a grid with one thing by default" do
				big_board = Big_board.new
				grid = big_board.grid
				expect(grid).to have(1).thing
			end

			it "creates a hidden_row of random 1-6 numbers" do
				big_board = Big_board.new
				hidden_row = big_board.hidden_row
				expect(hidden_row.get_cell(3).value).to be <= 6
				expect(hidden_row.get_cell(3).value).to be >= 1
			end

		end

		context "#add_row" do
			it "adds a row to the grid" do
				big_board = Big_board.new
				grid2 = big_board.add_row
				expect(grid2).to have(2).things
			end
		end

		context "#correct_position" do
			it "counts correct positions" do
				big_board = Big_board.new
				hidden = ["Y", "B", "B", "R"]
				row = ["Y", "B", "R", "G"]
				expect(big_board.correct_position(hidden, row)).to eq 2
			end
		end

		context "#row_status" do
			it "counts red and white" do
				big_board = Big_board.new
				hidden = ["G", "B", "B", "R"]
				row = ["Y", "B", "R", "G"]
				expect(big_board.row_status(hidden, row)).to eq [1, 2]
			end
		end

	end
end