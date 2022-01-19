require 'net/http'
class ResultsController < ApplicationController
  def index
    @game = Game.find(params[:game_id])
    @players = Player.all.select { |player| player.game_id == @game.id }
    p standings = request_standings_api
    @team_name = "Cameroon"
    # the final numbered index accces e.g. [0] above gives you access to each team's hash within the standings array
    # that has looks like this" { rank : 1, team : { id: 1, name: Cameroon} , .... , form: WDD}
    # p "This is response: #{parameters}" 
    # @team_form = standings["response"][0]["league"]["standings"][0][0]["form"]
    
    # just testing here:
    group_A_standings_array = standings["response"][0]["league"]["standings"][0]
    @team_form = group_A_standings_array.find { |team_hash| 
      team_hash["team"]["name"] == @team_name }["form"]
    standings.inspect
  end

  private
  def request_standings_api     
    url = URI("https://api-football-beta.p.rapidapi.com/standings?season=2021&league=6")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url) 
    request["x-rapidapi-host"] = 'api-football-beta.p.rapidapi.com'
    request["x-rapidapi-key"] = '3b09e8b915mshaca1e487c4eda14p11ff9ejsn21ca0d881c0e'

    response = http.request(request)
    # return nil if response.status != 200

    JSON.parse(response.body)
  end
end
