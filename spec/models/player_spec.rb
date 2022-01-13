require 'rails_helper'

RSpec.describe Player, type: :model do
  
  it { is_expected.to be }
 
  it 'it is a valid player object' do
    competition = Competition.create(name: "Africa Cup of Nations")
    game = Game.create(name: "Dean's game", competition_id: competition.id)
    player = Player.create(name: "John", game_id: game.id)
    expect(player).to be_valid
  end
end

# it 'is not valid game object' do
#   competition = Competition.create(name: "Africa Cup of Nations")
#   game = Game.create(name: "", competition_id: competition.id)
#   expect(game).to_not be_valid
# end