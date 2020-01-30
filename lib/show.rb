require_relative 'game'
require_relative 'player'
require_relative 'show'
require_relative 'board'
require_relative 'boardcase'

class Show
	def show_board(board)
		puts "  ┌───┬───┬───┐"
		puts "A │ #{board.board_case[0].value} │ #{board.board_case[1].value} │ #{board.board_case[2].value} │"
		puts "  ├───┼───┼───┤"
		puts "B │ #{board.board_case[3].value} │ #{board.board_case[4].value} │ #{board.board_case[5].value} │"
		puts "  ├───┼───┼───┤"
		puts "C │ #{board.board_case[6].value} │ #{board.board_case[7].value} │ #{board.board_case[8].value} │"
		puts "  └───┴───┴───┘"
		puts "    1   2   3  "
	end
end