class Player
  WINNING_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
  DEFAULT_BOARD = {'1'=>1, '2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7, '8'=>8, '9'=>9}
  @@new_board = DEFAULT_BOARD

  attr_accessor :name, :player_symbol, :playing_numbers

  @@players = {}
  @@current_player = nil
  def initialize(name, player_symbol)
    self.name = name
    self.player_symbol = player_symbol
    self.playing_numbers = []
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
    unless @@current_player
      puts 'Who plays first?'
      puts "\t1. #{players_name[0]}"
      puts "\t2. #{players_name[1]}"
      print 'Input (1/2): '
      selected_player = gets.chomp.to_i
      @@current_player = players_name[selected_player - 1]
    else
      @@current_player = 
        @@current_player == players_name[0] ?
        players_name[1] : players_name[0]
    end
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
 
  def self.set_playing_number(current_player)
    puts "Select a number from a board!"
    print "#{current_player}: "
    selected_number = gets.chomp.to_i
    @@players[current_player].playing_numbers.push(selected_number)
  end

  def self.update_board(playing_number)
    @@new_board[playing_number] = @@players[@@current_player].player_symbol
    Player.draw_board(@@new_board)
  end

  private
  
  def winner?(playing_numbers)
    WINNING_CONDITIONS.each do |win|
      ((win & playing_numbers) == win) ? true : false
    end
  end
end

#draw_board({"1"=>1, "2"=>2, "3"=>3, "4"=>4, "5"=>5, "6"=>6, "7"=>7, "8"=>8, "9"=>9})
