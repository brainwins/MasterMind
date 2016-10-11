class MasterMind

#user or cpu to guess
def initialize(who)
		if who.downcase == "user"
		@secret_code = []
		4.times do
			@secret_code.push(1 + rand(6))
		end
		game_cycle(who)
		elsif who.downcase == "cpu"
			puts "Enter the secret code"
			user_secret_code = gets.chomp
			@secret_code = user_secret_code.scan /\w/
			@secret_code.map! {|x| x.to_i}
			game_cycle(who)
		else
			puts "Select either cpu or user"
	end
		#puts @secret_code
end

def game_cycle(who)
	turns = 1

	while turns < 5
		who == "user" ? turn : turn_cpu
		if @game_won == true
			puts "You won!"
			break
		end
		turns += 1
	end
	
	puts "Game over. Code was #{@secret_code}" if turns == 5
	
end
def turn
	black_peg_counter = 0
	white_peg_counter = 0
	
	puts "Enter your numbers"
	user_input = gets.chomp
	user_input_array = user_input.scan /\w/
	user_input_array.map! {|x| x.to_i}
	
	user_input_array.each_with_index do |num, index|
		if num == @secret_code[index]
			black_peg_counter += 1 
		end
	end
	
	user_input_array.each {|num| for i in 0...4
									if num == @secret_code[i]
										white_peg_counter += 1 
										break
									end
								end
	}
	
	white_peg_counter -= black_peg_counter
	
	puts "White Pegs: #{white_peg_counter} \nBlack Pegs: #{black_peg_counter}"
	
	@game_won = true if black_peg_counter == 4
end

def turn_cpu
	puts "Cpu working"
	black_peg_counter = 0
	white_peg_counter = 0
	
	puts "Enter your numbers"
	user_input = gets.chomp
	user_input_array = user_input.scan /\w/
	user_input_array.map! {|x| x.to_i}
	
	user_input_array.each_with_index do |num, index|
		if num == @secret_code[index]
			black_peg_counter += 1 
		end
	end
	
	user_input_array.each {|num| for i in 0...4
									if num == @secret_code[i]
										white_peg_counter += 1 
										break
									end
								end
	}
	
	white_peg_counter -= black_peg_counter
	
	puts "White Pegs: #{white_peg_counter} \nBlack Pegs: #{black_peg_counter}"
	
	@game_won = true if black_peg_counter == 4
end

end	


myGame = MasterMind.new("cpu")
