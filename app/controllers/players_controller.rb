class PlayersController < ApplicationController

  def create
    @competition = Competition.find(params[:competition_id])
    @game = Game.find(params[:game_id])
    @player = @game.players.create(player_params)
    redirect_to competition_game_player_url(@competition.id, @game.id, @player.id)
  end

  def show
    @competition = Competition.find(params[:competition_id])
    @game = Game.find(params[:game_id])
    @player = Player.find(params[:id])
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end

end
