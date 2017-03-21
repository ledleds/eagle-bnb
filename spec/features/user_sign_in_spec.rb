feature 'User sign in' do

  scenario 'Sign in with correct credentials' do
    create_user
    sign_in
    expect(page).to have_content('Welcome, terryeagle')
  end

end
