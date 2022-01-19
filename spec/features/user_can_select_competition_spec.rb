require 'rails_helper'

RSpec.feature "Choose a competition", type: :feature do

  scenario "Can view competitions and select an individual competiton" do
    competition = Competition.new(name: "Africa Cup of Nations")
    competition.save
    visit "/"
    click_link "Create Sweepstake"

    expect(page).to have_content("Africa Cup of Nations")
  end

end
