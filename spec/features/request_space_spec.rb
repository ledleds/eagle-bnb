feature 'Requesting spaces' do

  before(:each) do
    sign_up
    click_list_space
    list_space
    visit '/spaces'
    click_link 'REQUEST'
    click_button 'Choose dates'
  end

  scenario 'user can request a space' do
    expect(page).to have_content('Please select arrival and departure dates.')
    fill_in :request_date_from, with: Date.new(2017,1,27)
    fill_in :request_date_to, with: Date.new(2017,1,28)
    click_button 'Request'
  end

  scenario 'user can\'t request a space if it is unavailable' do
    fill_in :request_date_from, with: Date.new(2017,1,24)
    fill_in :request_date_to, with: Date.new(2017,1,25)
    click_button 'Request'
    expect(page).to have_content('The property is not available for your chosen dates.')
  end

end
