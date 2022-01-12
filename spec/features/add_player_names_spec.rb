require 'rails_helper'

RSpec.describe "Add player names", type: :feature do
  scenario 'A user can add the names of one player in African cup of Nation sweepstake 1' do
    visit "/players/new"
    # visit '/competitions/1/sweepstakes/1/players/new'
    fill_in 'Player 1', with: 'John'  
    click_button 'Generate sweepstake'
    expect(page).to have_content('John')
  end
end

