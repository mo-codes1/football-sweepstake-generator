class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
    @teams = Team.all.select { |team| team.competition_id == @competition.id }
    @games = Game.all.select { |game| game.competition_id == @competition.id }
  end

  def destroy
    p params[:game_id]
    Game.find_by(id: params[:id]).destroy
  end

end
