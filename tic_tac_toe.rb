class Player
  attr_accessor :name, :player_symbol

  def initialize(name, player_symbol)
    self.name = name
    self.player_symbol = player_symbol
  end

  def self.instantiate_player
    players = {}
    2.times do |i|
      puts "Player #{i + 1}: "
      print "\tName: "
      name = gets.chomp
      print "\tSymbol[O/X]: "
      player_symbol = gets.chomp.upcase
      players[name] = Player.new(name, player_symbol)
    end
    players
  end
  
  def self.set_current_player
    players = instantiate_player
    puts 'Who plays first?'
    puts "\t1. #{players.keys[0]}"
    puts "\t2. #{players.keys[1]}"
    print 'Input (1/2): '
    current_player = gets.chomp.to_i
    players.keys[current_player - 1]
  end
  
  def self.draw_board(board_grid)
    puts "
         |     |     
     -#{board_grid["1"]}- | -#{board_grid["2"]}- | -#{board_grid["3"]}-
    _____|_____|_____
         |     |     
     -#{board_grid["4"]}- | -#{board_grid["5"]}- | -#{board_grid["6"]}- 
    _____|_____|_____
         |     |     
     -#{board_grid["7"]}- | -#{board_grid["8"]}- | -#{board_grid["9"]}- 
         |     |     "
  end
end

draw_board({"1"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9})