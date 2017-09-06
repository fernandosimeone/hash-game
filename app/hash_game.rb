require "./board"
require "./user_player"
require "./pc_random_player"

class HashGame

  CLEAR_CODE = %x{clear}

  def initialize
    @board = Board.new
    @player_1 = UserPlayer.new "Player 1"
    @player_2 = PcRandomPlayer.new "Player 2"
    @winner = nil
    @players = {
      :X => @player_1,
      :O => @player_2
    }

    @current_player = @players_1
  end

  def start

    while !@board.full? && @winner.nil?
      
      run_next_move
      completed_direction = @board.completed_direction

      if !completed_direction.nil?
        @winner = @current_player
      end
    end

    clear_screen
    p @board

    if @winner.nil?
      puts "\n\nThe game ended in a draw. Try to win in a new match."
    else
      puts "\n\nCongratulations!!!\n#{@winner.name} wins this match."
    end

    puts "\n\n"
  end

  def run_next_move
    
    clear_screen
    p @board

    @current_player = next_player
    symbol = @players.key(@current_player)

    puts "It's #{@current_player.name} time!"
    
    move = @current_player.get_next_move @board
    @board.mark symbol, move
  end

  def next_player
    @current_player == @player_1 ? @player_2 : @player_1
  end

  def clear_screen
    print CLEAR_CODE
  end
end
