class PlayersController < ApplicationController

  def index
    @competition = Competition.find(params[:competition_id])
    @players = Player.all
    @game = Game.find(params[:game_id])
  end

  def new
    @game = Game.find(params[:game_id])
    @player = @game.players.new
  end

  def create
    @competition = Competition.find(params[:competition_id])
    @game = Game.find(params[:game_id])
    i = 0
    afcon_arr = [45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68]
    @competition_teams_array = Team.all.select { |team| team.competition_id == @competition.id }
    @competition_teams_array.map do |team|
      team.id
    end
    p @competition_teams_array
      24.times do # Replace hardcoded 24 with the number of teams for the competition (@competition.number_of_teams) - Maybe add a new column in competitions table to make this possible
        @player = @game.players.create(name: params["player"]["player#{i + 1}"], team_id: afcon_arr[i])
        i += 1
      end
    redirect_to competition_game_player_url(@competition.id, @game.id, @player.id)
  end

  def show
    @competition = Competition.find(params[:competition_id])
    @game = Game.find(params[:game_id])
    @players = Player.all.select { |player| player.game_id == @game.id }
    @teams = Team.all.select { |team| team.competition_id == @competition.id }
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
  
end
