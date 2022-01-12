require 'rails_helper'

RSpec.describe Game, type: :model do
  it { is_expected.to be }

  it 'hasnt got a name' do
    competition = Competition.new(name: "Africa Cup of Nations").save
    game = Game.new(name: "", competition_id: competition)
    expect(game).to_not be_valid
  end

  it 'has a name' do
    competition = Competition.new(name: "Africa Cup of Nations").save
    game = Game.new(name: "Dean's game", competition_id: competition)
    expect(game).to be_valid
  end
end
