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
    
    it { expect(@board.completed_direction).to be_nil }
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

  context "when board is full with no completed directions" do

    before do
      @board = Board.new

      [[0, 0], [0, 1], [1, 2], [2, 0], [2, 2]].each do |pos|
        @board.mark :X, pos
      end
      
      [[0, 2], [1, 0], [1, 1], [2, 1]].each do |pos|
        @board.mark :O, pos
      end
    end

    it { expect(@board).to_not be_empty }
    
    it { expect(@board).to be_full }

    it { expect(@board.completed_direction).to be_nil }
  end

  context "when has a completed row" do

    before do
      @board = Board.new
      [[0, 1], [1, 1], [2, 1]].each { |p| @board.mark :X, p }
      @direction = @board.completed_direction
    end

    it { expect(@direction).to_not be_nil }

    it { expect(@direction[:row]).to eq(1) }
    
    it { expect(@direction[:symbol]).to eq(:X) }
  end

  context "when has a completed column" do

    before do
      @board = Board.new
      [[2, 0], [2, 1], [2, 2]].each { |p| @board.mark :O, p }
      @direction = @board.completed_direction
    end

    it { expect(@direction).to_not be_nil }

    it { expect(@direction[:col]).to eq(2) }
    
    it { expect(@direction[:symbol]).to eq(:O) }
  end

  context "when has the main diagonal completed" do

    before do
      @board = Board.new
      [[0, 0], [1, 1], [2, 2]].each { |p| @board.mark :O, p }
      @direction = @board.completed_direction
    end

    it { expect(@direction).to_not be_nil }

    it { expect(@direction[:diag]).to eq(0) }
    
    it { expect(@direction[:symbol]).to eq(:O) }
  end

  context "when has the secondary diagonal completed" do

    before do
      @board = Board.new
      [[2, 0], [1, 1], [0, 2]].each { |p| @board.mark :X, p }
      @direction = @board.completed_direction
    end

    it { expect(@direction).to_not be_nil }

    it { expect(@direction[:diag]).to eq(1) }
    
    it { expect(@direction[:symbol]).to eq(:X) }
  end

end