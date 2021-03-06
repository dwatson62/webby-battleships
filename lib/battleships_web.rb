require 'sinatra/base'
require 'battleships'

class BattleshipsApp < Sinatra::Base
  set :views, Proc.new { File.join(root, "views") }
  enable :sessions

  @@game = Game.new(Player, Board)

  get '/' do
    erb :index
  end

  get '/name' do
    erb :enter_name
  end

  get '/game' do
    session[:name1] = params[:name1]
    session[:name2] = params[:name2]
    @name1 = session[:name1]
    @player_1_own_board = @@game.own_board_view @@game.player_1
    erb :place_ship1
  end

  post '/game' do
    @coords = params[:coords]
    @direction = params[:direction]
    if @direction == 'Vertical'
      @@game.player_1.place_ship Ship.battleship, @coords, @direction
    else
      @@game.player_1.place_ship Ship.battleship, @coords
    end
    @player_1_state = 'done'
    @player_1_own_board = @@game.own_board_view @@game.player_1
    erb :view_board1
  end

  get '/game2' do
    @name2 = session[:name2]
    @player_2_own_board = @@game.own_board_view @@game.player_2
    erb :place_ship2
  end

  post '/game2' do
    @coords = params[:coords]
    @direction = params[:direction]
    if $direction == "Vertical"
      @@game.player_2.place_ship Ship.battleship, @coords, @direction
    else
      @@game.player_2.place_ship Ship.battleship, @coords
    end
    @player_2_own_board = @@game.own_board_view @@game.player_2
    @player_2_state = 'done'
    erb :view_board2
  end

  get '/fire1' do
    @player_1_opponent_board = @@game.opponent_board_view @@game.player_1
    @name1 = session[:name1]
    @name2 = session[:name2]
    if @@game.has_winner?
      erb :finish
    else
      erb :fire1
    end
  end

  post '/fire1' do
    @coords = params[:coords]
    @@game.player_1.shoot @coords.to_sym
    @@game.own_board_view @@game.player_1
    @name1 = session[:name1]
    @player_1_opponent_board = @@game.opponent_board_view @@game.player_1
    erb :view_board1
  end

  get '/fire2' do
    @player_2_opponent_board = @@game.opponent_board_view @@game.player_1
    @name1 = session[:name1]
    @name2 = session[:name2]
    if @@game.has_winner?
      @player_2_state = 'dead' if @@game.player_1.winner?
      erb :finish
    else
      erb :fire2
    end
  end

  post '/fire2' do
    @coords = params[:coords]
    @@game.player_2.shoot @coords.to_sym
    @player_2_opponent_board = @@game.opponent_board_view @@game.player_2
    erb :view_board2
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
