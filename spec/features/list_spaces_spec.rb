feature 'Listing Spaces' do

  before(:each) do
    sign_up
    click_list_space
  end

  scenario 'user has to be signed in' do
    click_button "Sign Out"
    visit ('/hosts')
    expect(page).to have_content 'Please sign in or sign up to list a space'
  end

  scenario 'user can list their space' do
    expect{list_space}.to change(Space, :count).by 1
    expect(Space.first.title).to eq 'The Crows Nest'
  end

  scenario 'user can list a space and see listings' do
    list_space
    click_link 'See Spaces'
    expect(page).to have_content 'The Crows Nest'
  end
end
