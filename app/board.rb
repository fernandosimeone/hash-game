
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


  def completed_direction

    dir = verify_direction(:row) { |row, i| @matrix[i][row] }
    return dir unless dir.nil?

    dir = verify_direction(:col) { |col, i| @matrix[col][i] }
    return dir unless dir.nil?

    dir = verify_direction_elements(:diag, 0) { |col, i| @matrix[i][i] }
    return dir unless dir.nil?

    dir = verify_direction_elements(:diag, 1) { |col, i| @matrix[2-i][i] }
    return dir unless dir.nil?

    nil
  end


  def verify_direction(dir)
    
    @matrix.each_index do |dir_index|

      completed = verify_direction_elements(dir, dir_index) do |i, j|
        yield(i, j)
      end

      return completed unless completed.nil?
    end

    nil
  end

  def verify_direction_elements(dir, dir_index)

    symbol = yield(dir_index, 0)

    @matrix.each_index do |elem_index|

      val = yield(dir_index, elem_index)

      return nil if (val.nil? || symbol.nil? || symbol != val)
    end

    { dir => dir_index, :symbol => symbol }
  end


  def p_pos(x, y)

    @matrix[x][y].nil? ? " " : @matrix[x][y]
  end

  def inspect
    "\n     0     1     2" + 
    "\n" + 
    "\n0    #{p_pos(0, 0)}  |  #{p_pos(1, 0)}  |  #{p_pos(2, 0)}  " +
    "\n   _____|_____|_____" +
    "\n        |     |" +
    "\n1    #{p_pos(0, 1)}  |  #{p_pos(1, 1)}  |  #{p_pos(2, 1)}" +
    "\n   _____|_____|_____" +
    "\n        |     |" +
    "\n2    #{p_pos(0, 2)}  |  #{p_pos(1, 2)}  |  #{p_pos(2, 2)}" +
    "\n"
  end

  private :p_pos
end