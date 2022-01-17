class PlayersController < ApplicationController

  def create
    @competition = Competition.find(params[:competition_id])
    @game = Game.find(params[:game_id])
    @teams = Team.all.select { |team| team.competition_id == params[:competition_id].to_i }.count
    i = 1
    (0...@teams).each do
      @game.players.create(name: params["player"]["name#{i}"])
      i += 1
    end
    redirect_to competition_game_player_url(@competition.id, @game.id, :id)
  end

  def show
    @competition = Competition.find(params[:competition_id])
    @game = Game.find(params[:game_id])
    @players = Player.all.select { |player| player.game_id == @game.id }
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end

end
