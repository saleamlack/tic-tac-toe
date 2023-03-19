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
      grid.each_with_index do |symbol, idx|
        print "\t" if [0, 3, 6].include?(idx)
        print " #{symbol || idx + 1} "
        print '|' unless [2, 5, 8].include?(idx)
        puts "\n\t---+---+---" if [2, 5].include?(idx)
        puts if idx == 8
      end
    end

    def move(player, position)
      grid[position - 1] = player.player_symbol
      player.playing_numbers << position
    end

    def valid_move?(position)
      return true if grid[position - 1].nil? && (1..9).include?(position)

      puts 'Invalid move. Please select an empty cell on the board'
      false
    end

    def full?
      grid.all?
    end
  end

  class Game
    attr_accessor :player1, :player2, :board, :current_player

    def initialize(player1_name, player2_name)
      self.player1 = Player.new(player1_name, 'X')
      self.player2 = Player.new(player2_name, 'O')
      self.board = Board.new
      self.current_player = nil
    end

    def play
      welcome
      set_current_player
      board.draw_board
      loop do
        position = set_playing_number
        redo unless board.valid_move?(position)
        board.move(current_player, position)
        board.draw_board
        break if winner? || board.full?

        switch_current_player
      end
      puts display_result
    end

    def set_current_player
      puts 'Who plays first?'
      puts "\t1. #{player1.name} (#{player1.player_symbol})"
      puts "\t2. #{player2.name} (#{player2.player_symbol})"
      print 'Input (1/2): '
      current_player = gets.chomp.to_i
      if valid_player?(current_player)
        self.current_player =
          current_player == 1 ? player1 : player2
      else
        set_current_player
      end
    end

    def switch_current_player
      self.current_player =
        if current_player == player1
          player2
        else
          player1
        end
    end

    def set_playing_number
      puts 'Put your symbol on postion: '
      print "#{current_player.name}: "
      played_number = gets.chomp.to_i
      current_player.playing_numbers.push(played_number)
      played_number
    end

    def winner?
      WINNING_CONDITIONS.each do |line|
        return true if (line & current_player.playing_numbers) == line
      end
      false
    end

    def display_result
      if winner?
        "#{current_player.name}(#{current_player.player_symbol}) wins! Congratulations! \nThanks for playing!"
      elsif board.full?
        "It's a tie! Great game.\nThanks for playing!"
      end
    end

    def valid_player?(player)
      return true if [1, 2].include?(player)

      puts 'Invalid player. Please Select player'
      false
    end

    def welcome
      puts '
Welcome to Tic-Tac-Toe!
    * To play, select a cell on the board to place your mark.
    * The first player to get three in a row wins!
Let\'s get started!

'
    end
  end
end
