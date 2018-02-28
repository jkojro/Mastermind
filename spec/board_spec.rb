require "spec_helper"

module Mastermind
	describe Board do

		context "#initialize" do
			it "initializes the board witha row" do
				expect {Board.new(row: "row")}.to_not raise_error
			end

			it "sets the row with four things by default" do
				board = Board.new
				expect(board.row).to have(4).things
			end
		end

		context "#row" do
			it "returns the row" do
				board = Board.new(row: "test-row")
				expect(board.row).to eq "test-row"
			end
		end

		context "#get_cell" do
			it "returns the cell based on coordinate" do
				row = ["", "J", 3, Object.new]
				board = Board.new(row: row)
				expect(board.get_cell(2)).to eq 3
			end
		end

		context "#set_cell" do
			it "sets a value to the cell by coordinate" do
				Obiekt = Struct.new(:value)
				row = ["", Obiekt.new("B"), "", ""]
				board = Board.new(row: row)
				board.set_cell(1, 3)
				expect(board.get_cell(1).value).to eq 3
			end
		end

		context "#game_status" do
			it "returns :winner if winner? is true" do
				board = Board.new
				board.stub(:winner?) {true}
				expect(board.game_status).to eq :winner
			end

			it "returns :status if winner? is false" do
				board = Board.new
				board.stub(:winner?) {false}
				expect(board.game_status).to eq :status
			end
		end

		context "#set_hidden row" do
			it "set int_to_letter" do
				hidden_board = Board.new
				expect(hidden_board.int_to_letter[1]).to eq 'Y'
				expect(hidden_board.int_to_letter[6]).to eq 'O'
			end

			it "creates a row with random letters as the cell's values" do	
				hidden_board = Board.new
				hidden_board.set_hidden_row
				expect("YBGRPO").to include(hidden_board.get_cell(1).value)
			end
		end
	end
end
