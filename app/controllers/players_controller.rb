class PlayersController < ApplicationController
  def index
    @players = Player.all
    @game = Game.find(params[:game_id])
  end

  def New
  end

  def create
    @competition = Game.find(params[:competition_id])
    @game = Game.find(params[:game_id])#(replace '1' with :game_id)
    @player = @game.players.create(player_params)
    redirect_to competitions_games_players(@competition.id, @game.id,) # this is not working 
  end

  private

  def player_params
    params.require(:player).permit(:name) ####### 
  end
end
