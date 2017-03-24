feature 'User listing' do

  before do
    sign_up
    click_link('List Space')
    list_space
    click_link('My Account')
  end

  scenario 'has user listings' do
    expect(page).to have_content('The Crows Nest')
  end

  scenario 'can be deleted' do
    expect{delete_listing}.to change(Space, :count).by -1
    expect(page).to have_content('Your listing has been sucessfully removed.')
  end

end
