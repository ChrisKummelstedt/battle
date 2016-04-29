feature 'dropkick like a tornado' do
  scenario 'flying mjaumare' do
    sign_in_and_play
    click_button ('Spinning Dropkick')
    expect(page).to have_content ('Slasher dropkicked Mittens like a boss tornado')
  end
end
