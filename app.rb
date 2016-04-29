require 'sinatra/base'
require './lib/fighter'
require './lib/game'

class Battle < Sinatra::Base

  before do
    @game = Game.instance
  end

  #start the game
  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Fighter.new(params[:player_1_name])
    player_2 = Fighter.new(params[:player_2_name])
    Game.create player_1, player_2, params[:gametype]
    redirect '/play'
  end

  get '/play' do
    @game.attack(@game.opponent) if @game.game_type == false && @game.opponent == @game.player_1
    redirect '/attack' if @game.game_type == false && @game.opponent == @game.player_1
    erb :play
  end

  #attacking
  get '/attack' do
    @game.attack(@game.opponent)
    return erb :attack unless @game.game_over?
    return redirect '/death' if @game.game_over?
  end

  get '/whirlwind' do
    @game.whirlwind(@game.opponent)
    return erb :whirlwind unless @game.game_over?
    return redirect '/death' if @game.game_over?
  end

  post '/switch_player' do
    @game.switch_turn
    redirect '/play'
  end

  get '/death' do
    erb :death
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
