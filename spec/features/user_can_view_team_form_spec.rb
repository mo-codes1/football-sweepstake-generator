require 'rails_helper'

RSpec.feature "View teams current form", type: :feature do
  scenario "User can click on button to see live form of AFCON" do
    competition = Competition.create(name: "Africa Cup of Nations")
    team = Team.create(name: "Algeria", competition_id: competition.id)
    team2 = Team.create(name: "Burkina Faso", competition_id: competition.id)
    visit "/competitions"
    click_link "Create Sweepstake"
    fill_in "game[name]", with: "Test sweepstake name"
    click_button "Set up your sweepstake"
    fill_in 'player_player1', with: 'John'  
    fill_in 'player_player2', with: 'Dave'  
    click_button 'Generate sweepstake'
    click_link 'View real-time results for your sweepstake'
    expect(page).to have_content("Live standings for your sweepstake:")
  end
  scenario "User can click on button to see live form of Premier League" do
    competition = Competition.create(name: "Premier League")
    team = Team.create(name: "Arsenal", competition_id: competition.id)
    team2 = Team.create(name: "Brentford", competition_id: competition.id)
    visit "/competitions"
    click_link "Create Sweepstake"
    fill_in "game[name]", with: "Test sweepstake name"
    click_button "Set up your sweepstake"
    fill_in 'player_player1', with: 'John'  
    fill_in 'player_player2', with: 'Dave'  
    click_button 'Generate sweepstake'
    click_link 'View real-time results for your sweepstake'
    expect(page).to have_content("Live standings for your sweepstake:")
  end
end