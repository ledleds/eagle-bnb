feature 'Requesting spaces' do

  scenario 'user can view spaces' do
    visit '/spaces'
    expect(page).to have_content 'Choose a space'
  end


  scenario
end
