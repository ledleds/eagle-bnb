feature 'User sign in' do

  scenario 'Sign in with correct credentials' do
    create_user
    sign_in
    expect(page).to have_content('Welcome, terryeagle')
  end

  scenario 'Sign in fails with incorrect password' do
    create_user
    sign_in(username: 'terryeagle', password: 'wrong')
    expect(page).to have_content('The username or password is incorrect')
  end

  scenario 'Sign in fails with incorrect username' do
    create_user
    sign_in(username: 'wrong', password: 'test')
    expect(page).to have_content('The username or password is incorrect')
  end

end
