class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
    @teams = Team.all.select { |team| team.competition_id == @competition.id }
  end
end
