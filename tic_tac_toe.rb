class Player
  attr_accessor :name, :player_symbol

  def initialize(name, player_symbol)
    self.name = name
    self.player_symbol = player_symbol
  end
end

def instantiate_player
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

def set_current_player
  players = instantiate_player
  puts 'Who plays first?'
  puts "\t1. #{players.keys[0]}"
  puts "\t2. #{players.keys[1]}"
  print 'Input (1/2): '
  current_player = gets.chomp.to_i
  players.keys[current_player - 1]
end

puts set_current_player
