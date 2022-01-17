class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
    @teams = Team.all.select { |team| team.competition_id == @competition.id }
    @games = Game.all.select { |game| game.competition_id == @competition.id }
  end

  def delete
    @game = Game.find(params[:id])
    @game.delete

    redirect_to root_path
  end

end
