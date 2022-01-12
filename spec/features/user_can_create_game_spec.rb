require 'rails_helper'

# RSpec.feature "Choose a competition", type: :feature do

#   scenario "Can view competitions and select an individual competiton" do
#     competition = Competition.new(name: "Africa Cup of Nations")
#     competition.save
#     visit "/"
#     click_link "Africa Cup of Nations"

#     expect(page).to have_content("Africa Cup of Nations")
#   end

# end

RSpec.feature "Input name of sweepstake", type: :feature do
  scenario "Can input name of a sweepstake and view it" do
    competition = Competition.new(name: "Australia Open")
    competition.save
    visit "/"
    click_link "Australia Open"
    fill_in "game[name]", with: "Dean's game"
    click_button "Create Game"
    expect(page).to have_content("Dean's game")
  end
end
