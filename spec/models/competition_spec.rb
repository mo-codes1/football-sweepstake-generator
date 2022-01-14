require 'rails_helper'

RSpec.describe Competition, type: :model do
  it { is_expected.to be }

  it 'is a valid competition object' do
    competition = Competition.create(name: "Africa Cup of Nations")
    expect(competition).to be_valid
  end

end
