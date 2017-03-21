feature 'Listing Spaces' do
  scenario 'user can list a space for rent' do
    visit('/')
    click_link 'List Space'
    expect(current_path).to eq '/hosts'
  end
end
