class Player
  attr_accessor :name, :player_symbol, :playing_numbers

  def initialize(name, player_symbol)
    self.name = name
    self.player_symbol = player_symbol
    self.playing_numbers = []
  end
end

class Board
  attr_accessor :grid

  def initialize
    self.grid = Array.new(9)
  end

  def self.draw_board(board = DEFAULT_BOARD)
    puts "
         |     |     
     -#{board["1"]}- | -#{board["2"]}- | -#{board["3"]}-
    _____|_____|_____
         |     |     
     -#{board["4"]}- | -#{board["5"]}- | -#{board["6"]}- 
    _____|_____|_____
         |     |     
     -#{board["7"]}- | -#{board["8"]}- | -#{board["9"]}- 
         |     |     "
  end

  def self.update_board(playing_number)
    @@new_board[playing_number] = @@players[@@current_player].player_symbol
    Player.draw_board(@@new_board)
  end
end

class Game
  WINNING_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  DEFAULT_BOARD = {'1'=>1, '2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7, '8'=>8, '9'=>9}
  @@new_board = DEFAULT_BOARD

  attr_accessor :player1, :player2, :current_player

  def initialize(player1_name, player2_name)
    self.player1 = Player.new(player1_name, "X")
    self.player2 = Player.new(player2_name, "O")
    self.current_player = self.set_current_player(self.player1, self.player2)
  end
  
  def set_current_player(player_1, player_2)
    puts 'Who plays first?'
    puts "\t1. #{player_1.name}"
    puts "\t2. #{players_2.name}"
    print 'Input (1/2): '
    current_player = gets.chomp.to_i
    self.current_player =
      current_player == 1 ? player_1 : player_2
  end
 
  def self.set_playing_number(current_player)
    puts "Select a number from a board!"
    print "#{current_player}: "
    selected_number = gets.chomp.to_i
    @@players[current_player].playing_numbers.push(selected_number)
  end

  def winner?(playing_numbers)
    WINNING_CONDITIONS.each do |win|
      ((win & playing_numbers) == win) ? true : false
    end
  end
end

#draw_board({"1"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9})
