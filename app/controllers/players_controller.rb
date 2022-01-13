class PlayersController < ApplicationController
  def index
    @competition = Competition.find(params[:competition_id])
    @players = Player.all
    @game = Game.find(params[:game_id])
  end

  def new
    @game = Game.find(params[:game_id]) #(replace '1' with :game_id)
    @player = @game.players.new
  end

  def create
    @competition = Competition.find(params[:competition_id])
    @game = Game.find(params[:game_id]) #(replace '1' with :game_id)
    @player = @game.players.create(name: params[:name]) # this was an issue
    redirect_to competition_game_players_path
  end

  private

  def player_params
    params.require(:player).permit(:name) ####### there's an issue here.
  end
end
