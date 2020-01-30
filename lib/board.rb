require_relative 'game'
require_relative 'player'
require_relative 'show'
require_relative 'board'
require_relative 'boardcase'

class Board
	attr_accessor :board_case, :count_turn
	def initialize
		@count_turn = 0
		@board_case = []
		x = 0
		while x < 9
			@board_case << BoardCase.new(x)
			x += 1
		end
	end
	def play_turn(player)
		print "#{player.name}, quelle case voulez vous remplir?\n> "
		case_nbr = pos(gets.chomp)
		if self.victory?[0] == true
			if player.value == "X"
				(@board_case[case_nbr].value == " ")? (@board_case[case_nbr].value = "X"): (puts "Vous ne pouvez pas jouer sur cette case.\nVous sautez votre tour.")
				sleep 1
				player = 2
			else
				(@board_case[case_nbr].value == " ")? (@board_case[case_nbr].value = "O"): (puts "Vous ne pouvez pas jouer sur cette case.\nVous sautez votre tour.")
				sleep 1
				player = 1
			end
		elsif self.victory?[0] == true
			self.game_end
		end
		@count_turn += 1
	end
	def pos(cords)
		if cords[0] == 'A'
			return cords[1].to_i - 1
		elsif cords[0] == 'B'
			return cords[1].to_i + 2
		elsif cords[0] == 'C'
			return cords[1].to_i + 5
		end
	end
	def victory?
		i = 0
		c = 0
		nul = ""
		ret = false
		ret2 = false
		while i < 8
		  str = ""
		  @board_case[i.. 2 + i].each { |w| str.concat(w.value)}
		  (str.to_s == "XXX" || str.to_s == "OOO")? (ret = false) : (ret = true)
		  i += 3
		  (ret == false)? (i = 8):nil
		end
		while c < 3
		  str = ""
		  @board_case.values_at(0 + c, 3 + c, 6 + c).each { |w|  str.concat(w.value)}
		  (str == "XXX" || str == "OOO")? (ret2 = false) : (ret2 = true)
		  c += 1
		  (ret2 == false)? (c = 3):nil
		end
		if @board_case.values_at(0, 4, 8).to_s.count("X") == 3 || @board_case.values_at(2, 4, 6).to_s.count("X") == 3
		  ret = false
		  str = "X"
		end
		if @board_case.values_at(0, 4, 8).to_s.count("O") == 3 || @board_case.values_at(2, 4, 6).to_s.count("O") == 3
		  ret = false
		  str = "O"
		end
		@board_case.each{ |c| nul.concat(c.value) }
		if nul.count(" ") == 0
			ret = false
			str = "nul"
		end
		(ret == false || ret2 == false )? (return [false, str[0]]): (return [true, "nil"])
	  end
end