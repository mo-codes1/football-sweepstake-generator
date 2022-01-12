class GamesController < ApplicationController

  def index
  end

  def create
    @competition = Competition.find(params[:competition_id])
    @game = @competition.games.create(game_params)
    # redirect_to game_path(@game.id)
    # In progress. Not working yet.
  end

  private
    def game_params
      params.require(:game).permit(:name)
    end
end
