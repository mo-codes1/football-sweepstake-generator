require 'net/http'
class ResultsController < ApplicationController
  def index
    standings = request_standings_api
    @team_name = standings["response"][0]["league"]["standings"][0][0]["team"]["name"] 
    # p "This is response: #{parameters}" 
    @team_form = standings["response"][0]["league"]["standings"][0][0]["form"] 
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
