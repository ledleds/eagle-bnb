def sign_up(username: 'terryeagle', name: 'Terry', email: 'terry@eagle.com', password: 'test', password_confirmation: 'test')
  visit '/'
  click_link 'Sign up'
  fill_in :username, with: username
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up!'
end
