require 'sinatra/base'
require 'battleships'

class McBattleships < Sinatra::Base

  # set :session_secret, 'battleships'

  get '/' do
    # session[:name] = "Ben"
    erb :index
  end

  get '/name' do
    erb :enter_name
  end

  get '/name2' do
    erb :enter_name2
  end

  get '/game' do
    $name1 = params[:name1]
    $game = Game.new Player, Board
    erb :place_ship1
  end

  post '/game' do
    $coords = params[:coords]
    $direction = params[:direction]
    if $direction == 'vertical'
      $game.player_1.place_ship Ship.battleship, $coords, $direction
    else
      $game.player_1.place_ship Ship.battleship, $coords
    end
    erb :view_board1
  end

  get '/game2' do
    $name2 = params[:name2]
    erb :place_ship2
  end

  post '/game2' do
    $coords = params[:coords]
    $direction = params[:direction]
    if $direction == 'vertical'
      $game.player_2.place_ship Ship.battleship, $coords, $direction
    else
      $game.player_2.place_ship Ship.battleship, $coords
    end
    erb :view_board2
  end

  get '/finish' do
    erb :finish
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
