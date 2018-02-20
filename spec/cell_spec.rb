require "spec_helper"

module Mastermind
	describe Cell do

		context "#initialize" do
			it "is initialize by default with a value of '' " do
				cell = Cell.new
				expect(cell.value).to eq ""
			end

			it "is initialized with a value of 'X'" do
				cell = Cell.new("X")
				expect(cell.value).to eq "X"
			end
		end
	end
end