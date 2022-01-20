require 'rails_helper'

RSpec.describe ResultsController, type: :controller do
  
  describe "GET /competitions/1/games/1/results" do
    it "response with status 200" do
      competition = Competition.new(name: "Africa Cup of Nations")
      competition.save
      game = Game.create(name: "Dean's game", competition_id: competition.id)
      game = Game.find_by(competition_id: competition.id, name: "Dean's game")
      team = Team.create(name: "Algeria", competition_id: competition.id)
      player = Player.create(name: "Dean", game_id: 1, team_id: 1 )
      expect(response).to have_http_status(200)
    end
  end

  
end
