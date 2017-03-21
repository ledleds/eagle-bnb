feature 'Requesting spaces' do

  before(:each) do

  end

  scenario 'user can view all spaces' do
    visit '/spaces'
    expect(page).to have_content 'Choose a space'
  end

  scenario 'user can view an individual space' do
    click_list_space
    list_space
    visit '/spaces'
    expect(page).to have_content 'The Crows Nest'
    click_link 'The Crows Nest'
    expect(current_path).to equal('/spaces?id=1')
  end

  scenario 'user can request a space' do
    view_spaces
    expect(page).to have_content('Your booking is complete, enjoy your stay!')
  end
end
