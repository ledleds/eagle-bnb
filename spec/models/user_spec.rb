require 'spec_helper'
require_relative '../../app/models/user.rb'

describe '.authenticate' do

  let!(:user) do
    User.create(username: 'terryeagle',
    name: 'Terry', email: 'terry@eagle.com',
    password: 'test', password_confirmation: 'test')
  end

  it 'authenticates sign in credentials against database' do
    authenticated_user = User.authenticate(user.username, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.username, 'wrong')).to be_nil
  end
end
