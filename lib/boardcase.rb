require_relative 'game'
require_relative 'player'
require_relative 'show'
require_relative 'board'
require_relative 'boardcase'

class BoardCase
    attr_accessor :value, :id
    def initialize(x)
        @value = " "
        @id = x
    end
end