require 'sinatra/base'
require 'battleships'

class McBattleships < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/name' do
    erb :enter_name
  end

  get '/game' do
    $name1 = params[:name1]
    $game = Game.new Player, Board
    erb :place_ship1
  end

  post '/game' do
    $coords = params[:coords]
    $direction = params[:direction]
    if $direction == 'Vertical'
      $game.player_1.place_ship Ship.battleship, $coords, $direction
    else
      $game.player_1.place_ship Ship.battleship, $coords
    end
    $player_1 = 'done'
    erb :view_board1
  end

  get '/game2' do
    $name2 = params[:name2]
    erb :place_ship2
  end

  post '/game2' do
    $coords = params[:coords]
    $direction = params[:direction]
    if $direction == "Vertical"
      $game.player_2.place_ship Ship.battleship, $coords, $direction
    else
      $game.player_2.place_ship Ship.battleship, $coords
    end
    $player_2 = 'done'
    erb :view_board2
  end

  get '/fire1' do
    erb :fire1
  end

  post '/fire1' do
    $coords = params[:coords]
    $game.player_1.shoot $coords.to_sym
    if $game.player_1.winner?
      $player_2 = 'dead'
    else
      $player_1 = 'shot'
    end
    erb :view_board1
  end

  get '/fire2' do
    if $player_1 == 'dead' || $player_2 == 'dead'
      erb :finish
    else
      erb :fire2
    end
  end

  post '/fire2' do
    $coords = params[:coords]
    $game.player_2.shoot $coords.to_sym
    if $game.player_2.winner?
      $player_1 = 'dead'
    else
      $player_2 = 'shot'
    end
    erb :view_board2
  end

  get '/finish' do
    erb :finish
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
