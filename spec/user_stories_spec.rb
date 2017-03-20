feature 'Testing infrastructure' do

  scenario 'homepage loads' do
    visit('/')
    expect(page).to have_content 'Welcome!'
  end

  scenario 'has sign up button' do
    visit '/'
    expect(page).to have_content 'Sign up'
  end

  # scenario 'user can sign up' do
  #   expect{sign_up}.to change(User, :count).by 1
  #   expect(User.first.email).to eq 'johndoe@internet.com'
  #   expect(page).to have_content 'Welcome, johndoe!'
  # end
end
