require_relative 'game'
require_relative 'player'
require_relative 'show'
require_relative 'board'
require_relative 'boardcase'

class Player
	attr_accessor :name, :value
	def initialize(user_name, value)
		@name = user_name
		@value = value
	end
end