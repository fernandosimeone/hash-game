require "spec_helper"
require "board"

describe Board do

  context "when initialized" do
    
    before do
      @board = Board.new
    end

    it { expect(@board).to be_empty }

    it { expect(@board).to_not be_full }

    it "has all plays available" do
      expect(@board.available_positions).to contain_exactly(
        [0, 0], [0, 1], [0, 2], [1, 0], [1, 1], 
        [1, 2], [2, 0], [2, 1], [2, 2])
    end
    
  end

  context "when a position is marked" do

    before do
      @board = Board.new
      @board.mark(:X, [2, 1])
    end

    it { expect(@board).to_not be_available_position([2, 1]) }
    
    it { expect(@board).to_not be_empty }

    it { expect(@board).to_not be_full }
    
  end

  context "when board is full" do
    it "should not be empty"
    it "should be full"
  end
end