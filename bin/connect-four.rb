#!/usr/bin/env ruby
require_relative '../lib/connect-four'

game = Game.new
puts game.welcome
puts "Give name to first player"
player1 = game.create_player(:red)
puts "Give name to second player"
player2 = game.create_player(:yellow)
game.play(player1, player2)
