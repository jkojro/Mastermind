require "spec_helper"

module Mastermind
	describe Game  do
		context "#info message" do
			it "prints an info message" do
				game = Game.new
				expected = "Wprowadź 4 strzały spośród kolorów: Y B G R P O, np. BOPG"
				expect(game.info).to eq expected
			end
		end

		context "#get_move" do
			it "converts a string to a row array" do
				game = Game.new
				expect(game.get_move("BYOP")).to eq ["B", "Y", "O", "P"]
			end

			it "gets a move and adds as a row to the grid" do
				game = Game.new
				row = game.get_move("BYOP")
				game.big_board.add_row(row)
				expect(game.big_board.grid.last).to eq ["B", "Y", "O", "P"]
			end
		end

		context "#print_status" do
			it "prints moves and their status" do
				game = Game.new
				row = game.get_move("BYOP")
				row2 = game.get_move("BBBB")
				game.big_board.add_row(row)
				game.big_board.add_row(row2)
				expected = "dsfdf"
				expect(game.print_status).to eq expected
			end
		end
	end
end