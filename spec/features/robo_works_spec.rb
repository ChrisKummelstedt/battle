feature 'Robo attacks Player 1' do
	scenario 'Loosing hp after players 2s turn' do
    sign_in_and_play_single_player
    click_button 'Scratch'
    click_button 'Revenge!'
    expect(page).to_not have_content("Poor Slasher only has 20 Hit Points")
  end
end
