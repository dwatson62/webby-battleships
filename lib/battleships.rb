require 'sinatra/base'
require 'battleships'

class McBattleships < Sinatra::Base

  enable :sessions


  get '/' do
    'Hello McBattleships!'
    session[:name] = "Ben"
    erb :index
  end

  get '/game' do
    puts params[:name]
    puts session[:name]
    puts params[:coords]
    session[:name] ||= params[:name]
    puts session[:name]
    puts session
    puts params
    @coords = params[:coords]
    if session[:name] == nil || session[:name] == ""
      erb :enter_name
    else
      if @coords == nil
        #start the actual game by calling helpers that run the battleships methods etc.
        @game = Game.new Player, Board
        @game.player_1.place_ship Ship.battleship, :B4, :vertically
        erb :view_board
      else
        @coords = @coords.to_sym
        @game.player_2.shoot @coords
        erb :view_board
      end
    end
  end

    helpers do
      def some_helper
        #blah
      end
    end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
