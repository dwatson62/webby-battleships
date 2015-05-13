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

  get '/game' do
    $game = Game.new Player, Board
    erb :place_ship
  end

  post '/game' do
    $coords = params[:coords]
    $game.player_1.place_ship Ship.battleship, $coords
    erb :view_board
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
