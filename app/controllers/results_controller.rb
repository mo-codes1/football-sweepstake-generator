require 'net/http'
require 'uri'
require 'openssl'

class ResultsController < ApplicationController
  def index
    @competition = Competition.find(params[:competition_id])
    @game = Game.find(params[:game_id])
    @players = Player.all.select { |player| player.game_id == @game.id } 
    update_team_form
  end

  private

  def update_team_form
    # p team_array = Team.all.select { |team| team.competition_id == @competition.id }
    team_array = Team.all.select { |team| team.competition_id == @competition.id }.map { |team| team.name}
    standings = request_standings_api
    @standings_array = standings["response"][0]["league"]["standings"]
    p @standings_array.flatten!
    team_array.each do |team|
      @team_form = @standings_array.find { |team_hash| team_hash["team"]["name"] == team }["form"] 
      team = Team.find_by(name: team)
      team.update(form: @team_form)
    end
  end

  def request_standings_api     
    if @competition.id == 1 
      url = URI("https://api-football-v1.p.rapidapi.com/v3/standings?season=2021&league=6")
    elsif @competition.id == 2
      url = URI("https://api-football-v1.p.rapidapi.com/v3/standings?season=2021&league=39")
    end

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url) 
    request["x-rapidapi-host"] = 'api-football-v1.p.rapidapi.com'
    request["x-rapidapi-key"] = ENV.fetch('RAPID_API_KEY')

    response = http.request(request)
    # return nil if response.status != 200 # need to change this to Net:HTTP syntax
    JSON.parse(response.body)
  end
end

