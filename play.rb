require './tic_tac_toe'
include TicTacToe

players = Game.get_players
game = Game.new(*players)
game.play
