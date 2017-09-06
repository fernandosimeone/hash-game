
class UserPlayer

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_next_move(board)

    is_valid_move = false

    while !is_valid_move do
      
      is_valid_move = true
      print "Enter your next move (x,y): "
      input = gets.chomp

      is_valid_move = validate_move(input, board)
    end

    parse_move_input(input)
  end

  def validate_move(input, board)

    if !valid_move_input?(input)

      puts "\nInvalid input. The correct format is x,y and " +
           "the range for x and y is 0-2.\n" + 
           "For example \"2,1\" or \"0,2\"."
      
      return false
    end

    position = parse_move_input(input)
    
    if !board.available_position?(position)
      puts "\nThis position has already been taken. " +
           "Select another one."

      return false
    end
      
    true
  end

  def parse_move_input(input)
    input.split(",").map { |s| s.to_i }
  end

  def valid_move_input?(input)
    input =~ /[0-2],[0-2]/
  end
end