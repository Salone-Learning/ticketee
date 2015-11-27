require 'spec_helper'

describe User do
  describe 'passwords' do
    it 'needs a password and confirmation to save' do
      user = User.create(name: 'steve')
      user.save

      expect(user).to_not be_valid

      user.password = 'hunter'
      user.password_confirmation = ''
      user.save

      expect(user).to_not be_valid

      user.password_confirmation = 'hunter'
      user.save

      expect(user).to be_valid
    end

    it 'needs password and confirmation to match' do
      user = User.create(name: 'steve',
        password: 'hunter',
        password_confirmation: 'hunter2')

      user.save
      expect(user).to_not be_valid
    end
  end

  describe 'authentication' do
    let(:user) { User.create(name: 'steve',
        password: 'hunter',
        password_confirmation: 'hunter')}

    it 'authenticates with a correct password' do
      expect(user.authenticate('hunter')).to be
    end

    it 'does not authenticate with a wrong password' do
      expect(user.authenticate('hunter2')).to_not be
    end
  end
end
