feature 'Requesting spaces' do

  before(:each) do
    sign_up
  end

  scenario 'user can request a space' do
    click_list_space
    list_space
    visit '/spaces'
    click_link 'REQUEST'
    click_button 'Request booking'
    expect(page).to have_content('Your booking is complete, enjoy your stay!')
  end

end
