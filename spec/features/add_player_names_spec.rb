require 'rails_helper'

RSpec.describe "Add player names", type: :feature do
  scenario 'A user can add the names of one player in the sweepstake' do
    visit '/competitions/:competition_id/sweepstakes/new/'
    fill_in 'Player 1', with: 'John'  
    click_button 'Generate sweepstake'
    expect(page).to have_content('John')
  end
end

