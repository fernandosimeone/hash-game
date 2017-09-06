class PcRandomPlayer

  attr_reader :name

  def initialize(name)
    @name = name
    @random = Random.new
  end

  def get_next_move(board)

  	 i = @random.rand(board.available_positions.length)
  	 board.available_positions[i]
  end
end