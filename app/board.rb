
class Board

  @@num_of_positions = 9
  @@range = 0..2

  def initialize
    
    @matrix = Array.new(3) { Array.new(3) }
    @available_positions = []

    @matrix.each_index do |i|
      @matrix.each_index do |j|

        @available_positions.push [i, j]

      end
    end
  end

  def empty?
    @available_positions.length == @@num_of_positions
  end

  def full?
    @available_positions.empty?
  end

  def available_positions
    @available_positions
  end

  def available_position?(position)
    @available_positions.include? position
  end

  def mark(simb, position)
    x, y = position

    raise "Position already marked. [#{position}]" unless @matrix[x][y].nil?

    if !@@range.include?(x) || !@@range.include?(y)
      raise "Posição fora dos limites. [#{x}, #{y}]" 
    end

    @matrix[x][y] = simb
    @available_positions.delete(position)
  end

  def p_pos(x, y)

    @matrix[x][y].nil? ? " " : @matrix[x][y]
  end

  def inspect
    "\n     0     1     2    X" + 
    "\n" + 
    "\n0    #{p_pos(0, 0)}  |  #{p_pos(1, 0)}  |  #{p_pos(2, 0)}  " +
    "\n   _____|_____|_____" +
    "\n        |     |" +
    "\n1    #{p_pos(0, 1)}  |  #{p_pos(1, 1)}  |  #{p_pos(2, 1)}" +
    "\n   _____|_____|_____" +
    "\n        |     |" +
    "\n2    #{p_pos(0, 2)}  |  #{p_pos(1, 2)}  |  #{p_pos(2, 2)}" +
    "\n\nY\n"
  end

  private :p_pos
end