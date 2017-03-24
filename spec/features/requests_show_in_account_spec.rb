feature 'My account bookings' do
  scenario 'user can view bookings in their account' do
    first_user_lisitng
    second_user_request
    click_link 'My Account'
    expect(page).to have_content('The Crows Nest')
  end
end
