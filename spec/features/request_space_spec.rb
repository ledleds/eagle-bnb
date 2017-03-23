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
    fill_in :request_date_from, with: '2017-01-27'
    fill_in :request_date_to, with: '2017-01-28'
    click_button 'Request'
  end

  scenario 'user can\'t request a space if it is unavailable' do
    fill_in :request_date_from, with: '2017-01-24'
    fill_in :request_date_to, with: '2017-01-25'
    click_button 'Request'
    expect(page).to have_content('The property is not available for your chosen dates.')
  end

  # scenario 'user can\'t request a space if it is already booked' do
  #   click_button 'Request'
  # end

end
