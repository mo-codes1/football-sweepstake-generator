require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe "POST /games" do
    it "responds with 200" do
      competition = Competition.new(name: "Africa Cup of Nations")
      competition.save
      post :create, params: { game: {name: "Dean's game"}, competition_id: competition.id }
      game = Game.find_by(competition_id: competition.id, name: "Dean's game")
      expect(response).to redirect_to "/competitions/#{competition.id}/games/#{game.id}"
    end
    it "Creates a game" do
      competition = Competition.new(name: "Africa Cup of Nations")
      competition.save
      post :create, params: { game: {name: "Dean's game"}, competition_id: competition.id }
      expect(Game.find_by(competition_id: competition.id, name: "Dean's game")).to be
    end 
  end

  describe "#randomised_team_array" do
    pending
    it 'returns a randomised array of team ids' do
      competition = Competition.new(name: "Africa Cup of Nations")
      game = Game.create(name: "Dean's game", competition_id: competition.id)
      Team.create(name: "Algeria", competition_id: 1) 
      Team.create(name: "Burkina Faso", competition_id: 1) 
      Team.create(name: "Cabo Verde", competition_id: 1) 
      Team.create(name: "Cameroon", competition_id: 1)
      expect(game.randomised_team_array).not_to eq [1, 2, 3, 4]
      expect(game.randomised_team_array.length).to be 4
      expect(game.randomised_team_array).to include(1, 2, 3, 4)
    end
  end


end  
