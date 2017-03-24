feature 'approving request' do

  scenario 'user can approve an incoming request' do
    sign_up
    click_list_space
    list_space
    click_button 'Sign Out'
    second_user_request
    visit '/spaces'
    click_link 'My Account'
    expect(page).to have_content 'pending'
    click_button 'Sign Out'
    sign_in
    click_link 'My Account'
    click_button 'Approve'
    click_button 'Sign Out'
    sign_in_alternative
    click_link 'My Account'
    expect(page).to have_content 'approved'
  end

    scenario 'user can view bookings in their account' do
      sign_up
      click_list_space
      list_space
      click_button 'Sign Out'
      sign_up_alternative
      click_link 'View Spaces'
      click_link 'View Details'
      expect(page).to have_content 'Available'
      click_button 'Choose dates'
      fill_in :request_date_from, with: Date.new(2017,1,27)
      fill_in :request_date_to, with: Date.new(2017,1,28)
      click_button 'Request'
      click_link 'My Account'
      expect(page).to have_content('The Crows Nest')
    end




end
