require 'date'

def sign_up(username: 'terryeagle', name: 'Terry', email: 'terry@eagle.com', password: 'test', password_confirmation: 'test')
  visit '/'
  click_link 'Sign Up'
  fill_in :username, with: username
  fill_in :name, with: name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign Up!'
end

def sign_in(username: 'terryeagle', password: 'test')
  visit '/'
  click_link 'Sign In'
  fill_in :username, with: username
  fill_in :password, with: password
  click_button 'Sign In!'
end

def create_user
  User.create(name: 'Terry',
      username: 'terryeagle',
      email: 'terry@eagle.com',
      password: 'test',
      password_confirmation: 'test')
end

def click_list_space
  visit('/')
  click_link 'List Space'
end

def list_space(title: 'The Crows Nest',
              description: 'Cosy cottage in the heart of Devon',
              price: 65,
              date_from: '2017-01-26',
              date_to: '2017-01-29')
              # date_from: Date.new(2017, 1, 26),
              # date_to: Date.new(2017, 1, 29))
  fill_in :title, with: title
  fill_in :description, with: description
  fill_in :price, with: price
  fill_in :date_from, with: date_from
  fill_in :date_to, with: date_to
  click_button 'List my space'
end
