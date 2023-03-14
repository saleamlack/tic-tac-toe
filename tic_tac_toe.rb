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

players = instantiate_player