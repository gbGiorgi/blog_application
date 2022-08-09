# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'notification' do
    subject(:notification) { Notification.create }

    it { should belong_to(:recipient) }
  end
end
