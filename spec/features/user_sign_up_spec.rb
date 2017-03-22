feature 'User sign up' do

  scenario 'homepage loads' do
    visit('/')
    expect(page).to have_content 'Welcome!'
  end

  scenario 'has sign up button' do
    visit '/'
    expect(page).to have_content 'Sign Up'
  end

  scenario 'user can sign up' do
    expect{sign_up}.to change(User, :count).by 1
    expect(User.first.email).to eq 'terry@eagle.com'
    expect(page).to have_content 'Welcome, terryeagle'
  end

  scenario 'user cannot sign up without entering an email' do
    expect {sign_up(email:nil)}.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'sign up fails if no username is entered' do
    expect {sign_up(username:nil)}.not_to change(User, :count)
    expect(page).to have_content('Username must not be blank')
  end

  scenario 'sign up fails with an existing username' do
    sign_up(username: 'terry', email: "b@a.com")
    expect {sign_up(username: 'terry', email: "c@s.com")}.not_to change(User, :count)
    expect(page).to have_content('Username is already taken')
  end

  scenario 'sign up fails with an existing email' do
    sign_up
    expect {sign_up}.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'sign up fails if no password confirmation is entered' do
    expect {sign_up(password_confirmation: nil)}.not_to change(User, :count)
    expect(page).to have_content('Password does not match the confirmation')
  end

   scenario 'sign up fails if password confirmation is incorrect' do
    expect {sign_up(password_confirmation: '1234')}.not_to change(User, :count)
    expect(page).to have_content('Password does not match the confirmation')
  end


end
