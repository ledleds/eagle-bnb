feature 'User sign out' do

   scenario 'while being signed in as a user' do
     create_user
     sign_in(username: 'terryeagle', password: 'test')
     click_button 'Sign Out'
     expect(page).to have_content('Goodbye!')
     expect(page).not_to have_content('Welcome, terryeagle')
   end
end
