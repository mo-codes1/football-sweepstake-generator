class GamesController < ApplicationController

  def create
    @competition = Competition.find(params[:competition_id])
    @game = @competition.games.create(game_params)
    redirect_to new_competition_game_player_path(@competition.id, @game.id)
  end

  def show
    @competition = Competition.find(params[:competition_id])
    @game = Game.find(params[:id])
  end

  private
    def game_params
      params.require(:game).permit(:name)
    end
end
