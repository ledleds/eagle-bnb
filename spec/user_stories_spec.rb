feature 'Testing infrastructure' do

  scenario 'homepage loads' do
    visit('/')
    expect(page).to have_content 'Welcome!'
  end

  scenario 'has sign up button' do
    visit '/'
    expect(page).to have_content 'Sign up'
  end

  scenario 'user can sign up' do
    expect{sign_up}.to change(User, :count).by 1
    expect(User.first.email).to eq 'terry@eagle.com'
    expect(page).to have_content 'Welcome new user!'
  end

  scenario 'user cannot sign up without entering an email' do
    expect {sign_up(email:nil)}.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'sign up fails if no username is entered' do
    expect {sign_up(username:nil)}.not_to change(User, :count)
    expect(page).to have_content('Username must not be blank')
  end

end
