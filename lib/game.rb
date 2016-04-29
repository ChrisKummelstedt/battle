class Game
	attr_reader :player_1, :player_2, :current_player, :opponent, :game_type

	def initialize player_1, player_2, game_type
		game_type == "true" ? @game_type = true : @game_type = false
		@player_1 = player_1
		@player_2 = player_2
		@player_2.name = "Robo#{@player_2.name}" unless @game_type
		@current_player = player_1
		@opponent = @player_2
	end

	def attack opponent
		opponent.receive_damage
	end

	def whirlwind opponent
		seed = Random.new.rand(2)
    seed == 0 ? @hp = @hp : opponent.receive_whirlwind_damage
	end

	def switch_turn
		@current_player = @opponent
		@opponent = player_1 if @current_player == player_2
		@opponent = player_2 if @current_player == player_1
	end

	def game_over?
		@player_1.hp == 0 || @player_2.hp == 0
	end


	def self.create(player_1, player_2, game_type)
		@game = Game.new(player_1, player_2, game_type)
	end

	def self.instance
		@game
	end


end
