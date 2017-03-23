feature 'My account bookings' do
  scenario 'user can view bookings in their account' do
    sign_up
    click_list_space
    list_space
    click_button 'Sign Out'
    sign_up_alternative
    click_link 'View Spaces'
    click_link 'REQUEST'
    expect(page).to have_content 'Available'
    click_button 'Request booking'
    click_link 'My Account'
    expect(page).to have_content('The Crows Nest')
  end
end
