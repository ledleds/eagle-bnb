feature 'Listing Spaces' do

  before(:each) do
    click_list_space
  end

  xscenario 'user has to be signed in' do
    expect(page).to have_content 'You have to be signed in to list a space'
  end

  scenario 'user can list a space for rent' do
    # sign_in # This will be implemented when sign-in has been created
    expect(current_path).to eq '/hosts'
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
