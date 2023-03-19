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

  def draw_board
    self.grid.each_with_index do |symbol, idx|
      _symbol = symbol ? symbol : idx
      print " #{_symbol} "
      puts '|' unless idx == 2 || idx == 5 || idx == 8
      puts "\n---+---+---" if idx == 2 || idx == 5
      puts if idx == 8
    end
  end

  def move(player, position)
    self.grid[position - 1] = player.player_symbol
    player.playing_numbers << position
  end

  def valid_move?(position)
    grid[position - 1].nil?
  end

  def full?
    grid.all?
  end
end

class Game
  WINNING_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

  attr_accessor :player1, :player2, :boare, :current_player

  def initialize(player1_name, player2_name)
    self.player1 = Player.new(player1_name, "X")
    self.player2 = Player.new(player2_name, "O")
    self.board = Board.new
    self.current_player = self.set_current_player(self.player1, self.player2)
  end
  
  def set_current_player
    puts 'Who plays first?'
    puts "\t1. #{self.player1.name}"
    puts "\t2. #{self.players2.name}"
    print 'Input (1/2): '
    current_player = gets.chomp.to_i
    self.current_player =
      current_player == 1 ? self.player1 : self.player2
  end

  def switch_current_player
    self.current_player = 
      self.current_player == self.player1 ?
      self.player2 : self.player1
  end
 
  def set_playing_number
    puts "Put your symbol on postion: "
    played_number = gets.chomp.to_i
    self.current_player.playing_numbers.push(played_number)
  end

  def winner?
    WINNING_CONDITIONS.each do |line|
      (line & self.current_player.playing_numbers) == line
    end
  end

  def display_result
    if winner?
      "#{self.current_player.name} Win!"
    elsif full?
      "Its a draw!"
    end
  end
end

#draw_board({"1"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9})
