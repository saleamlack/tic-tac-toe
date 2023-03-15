class Player
  DEFAULT_BOARD = {'1'=>1, '2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7, '8'=>8, '9'=>9}

  attr_accessor :name, :player_symbol

  @@players = {}
  @@current_player = nil
  def initialize(name, player_symbol)
    self.name = name
    self.player_symbol = player_symbol
  end

  def self.instantiate_player
    2.times do |i|
      puts "Player #{i + 1}: "
      print "\tName: "
      name = gets.chomp
      print "\tSymbol[O/X]: "
      player_symbol = gets.chomp.upcase
      @@players[name] = Player.new(name, player_symbol)
    end
  end
  
  def self.set_current_player(players_name)
    puts 'Who plays first?'
    puts "\t1. #{players_name[0]}"
    puts "\t2. #{players_name[1]}"
    print 'Input (1/2): '
    selected_player = gets.chomp.to_i
    @@current_palyer = players_name[selected_player - 1]
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

#draw_board({"1"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9})
