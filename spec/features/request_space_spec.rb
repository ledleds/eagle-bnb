feature 'Requesting spaces' do

  before(:each) do
    sign_up
  end

  # scenario 'user can view all spaces' do
  #   visit '/spaces'
  #   expect(page).to have_content 'Choose a space'
  # end
  #
  # scenario 'user can view an individual space' do
  #   click_list_space
  #   list_space
  #   visit '/spaces'
  #   expect(page).to have_content 'The Crows Nest'
  #   click_link 'The Crows Nest'
  #   expect(page).to have_content('65')
  # end

  scenario 'user can request a space' do
    click_list_space
    list_space
    visit '/spaces'
    click_link 'The Crows Nest'
    click_link 'Request booking'
    expect(page).to have_content('Your booking is complete, enjoy your stay!')
  end


  scenario ''

end
