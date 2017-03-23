feature 'User listing' do

  scenario 'has user listings' do
    sign_up
    click_link('List Space')
    list_space
    click_link('My Account')
    expect(page).to have_content('The Crows Nest')
  end
end
