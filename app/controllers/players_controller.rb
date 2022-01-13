class PlayersController < ApplicationController
  def index
    @players = Player.all
    @game = Game.find(params[:game_id])
  end

  def new
  end

  def create
    @game = Game.find(params[:game_id])#(replace '1' with :game_id)
    @player = @game.players.create(player_params)
    redirect_to competition_game_players_path(@competition.id, @game.id, @player.id) # this is not working 
  end

  private

  def player_params
    params.require(:player).permit(:name) ####### 
  end
end
