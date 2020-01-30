require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/show'
require_relative 'lib/board'
require_relative 'lib/boardcase'

current_game = Game.new
i = 1
	
while true do
	puts "Partie numero #{i}"
	while current_game.status == true
		current_game.turn
	end
	i += 1 
	current_game.game_end
	current_game.new_round
end