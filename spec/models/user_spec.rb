# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'user' do
    subject(:user) do
      User.create(email: 'bobokhidze-01@mail.ru',
                  password: 'giorguna123',
                  password_confirmation: 'giorguna123',
                  name: 'გიო')
    end
    subject(:admin) do
      User.create(email: 'gbobokhidze@gmail.com',
                  password: 'password',
                  password_confirmation: 'password',
                  name: 'Giorgi',
                  role: 'admin')
    end

    it { should validate_presence_of(:name) }
    it { should_not validate_presence_of(:avatar) }
    it { should_not validate_presence_of(:mobiles) }
    it { should_not validate_presence_of(:likes) }
    it { should_not validate_presence_of(:locations) }

    it { should have_many(:mobiles) }
    it { should have_many(:comments) }
    it { should have_many(:notifications) }
    it { should have_many(:likes) }
    it { should have_many(:locations) }

    it { should have_one_attached(:avatar) }

    it 'role -> user' do
      expect(user.user?).to be_truthy
    end

    it 'role -> user' do
      expect(user.admin?).to be_falsey
    end

    it 'role -> admin' do
      expect(admin.admin?).to be_truthy
    end

    it 'role -> admin' do
      expect(admin.user?).to be_falsey
    end
  end
end
