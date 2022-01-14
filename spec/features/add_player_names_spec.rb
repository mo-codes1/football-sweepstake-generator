require 'rails_helper'

RSpec.describe "Add player names", type: :feature do
  scenario 'A user can add the names of one player in African cup of Nation sweepstake 1' do
    competition = Competition.create(name: "African cup of Nation")
    competition.games.create(name: "AFCON")
    visit "/competitions/1/games/1/players/new"
    fill_in 'player1', with: 'John'  
    click_button 'Generate sweepstake'
    expect(page).to have_content('John')
  end
  scenario "a user can add 2 names for the african cup of nations" do
    competition = Competition.create(name: "African cup of Nation")
    game = competition.games.create(name: "AFCON")
    visit "/competitions/2/games/2/players/new"
    fill_in "player1", with: "john"
    fill_in "player2", with: "josh"
    click_button 'Generate sweepstake'
    expect(page).to have_content("john")
    expect(page).to have_content("josh")
  end
end

