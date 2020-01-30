require_relative 'game'
require_relative 'player'
require_relative 'show'
require_relative 'board'
require_relative 'boardcase'

class Game
	attr_accessor :status, :board, :arr_player, :curr_board, :p1, :p2
	def initialize
		print "Joueur 1, quel est votre pseudo ?\n> "
		@p1 = Player.new(gets.chomp, "X")
		print "Joueur 2, quel est votre pseudo ?\n> "
		@p2 = Player.new(gets.chomp, "O")
		@board = Board.new
		@arr_player = []
		@arr_player << p1
		@arr_player << p2
		@status = true
		@curr_player = self
		@curr_board = Show.new
	end
	def turn
		arr_player.each do |player|
			system("clear")
			@curr_board.show_board(@board)
			@board.play_turn(player)
		end
		@status = @board.victory?[0]
	end
	def new_round
		system("clear")
		puts "Souhaitez vous jouer une autre partie ?"
		print "\n        Oui?        Non?\n\n> "
		choice = gets.chomp
		if choice == "oui" || choice == "Oui"
			@board = nil
			@board = Board.new
			@status = true
		elsif choice == "non" || choice == "Non"
		   exit
		else
		   self.new_round
		end
	end
	def game_end
		system("clear")
		result = @board.victory?[1]
		if result == "X"
			@curr_board.show_board(@board)
			puts "Félicitations #{p1.name}, vous avez gagné !"
		elsif result == "O"
			@curr_board.show_board(@board)
			puts "Félicitations #{p2.name}, vous avez gagné !"
		else
			@curr_board.show_board(@board)
			puts "Match nul"
		end
		puts "Appuyer sur " + "\"ENTRÉE\"".colorize(:red) + " pour continuer"
		gets.chomp
	end
end