module TicTacToe
  WINNING_CONDITIONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

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
        _symbol = symbol ? symbol : idx + 1
        print " #{_symbol} "
        print '|' unless idx == 2 || idx == 5 || idx == 8
        puts "\n---+---+---" if idx == 2 || idx == 5
        puts if idx == 8
      end
    end

    def move(player, position)
      self.grid[position - 1] = player.player_symbol
      player.playing_numbers << position
    end

    def valid_move?(position)
      return true if grid[position - 1].nil? && (1..9).include?(position)
      puts "Invalid move. Please select an empty cell on the board"
      false
    end

    def full?
      grid.all?
    end
  end

  class Game
    attr_accessor :player1, :player2, :board, :current_player

    def initialize(player1_name, player2_name)
      self.player1 = Player.new(player1_name, "X")
      self.player2 = Player.new(player2_name, "O")
      self.board = Board.new
      self.current_player = nil
    end

    def play
      self.set_current_player
      self.board.draw_board
      loop do
        position = self.set_playing_number
        redo unless board.valid_move?(position)
        self.board.move(self.current_player, position)
        self.board.draw_board
        break if self.winner? || self.board.full?
        self.switch_current_player
      end
      puts self.display_result
    end
    
    def set_current_player
      puts 'Who plays first?'
      puts "\t1. #{self.player1.name} (#{self.player1.player_symbol})"
      puts "\t2. #{self.player2.name} (#{self.player2.player_symbol})"
      print 'Input (1/2): '
      current_player = gets.chomp.to_i
      self.set_current_player unless valid_player?(current_player)
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
      print "#{self.current_player.name}: "
      played_number = gets.chomp.to_i
      self.current_player.playing_numbers.push(played_number)
      played_number
    end

    def winner?
      WINNING_CONDITIONS.each do |line|
        return true if (line & self.current_player.playing_numbers) == line
      end
      false
    end

    def display_result
      if self.winner?
        "#{self.current_player.name}(#{self.current_player.player_symbol}) wins! Congratulations!
         Thanks for playing!"
      elsif self.board.full?
        "It's a tie! Great game.
         Thanks for playing!"
      end
    end

    def valid_player?(player)
      return true if player == 1 || player == 2
      puts "Invalid player. Please Select player"
      false
    end
  end
end
