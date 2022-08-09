# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mobile, type: :model do
  describe 'mobile' do
    subject(:mobile) do
      Mobile.create(
        number: '574482992',
        country: 'GE'
      )
    end

    it { should belong_to(:user) }
  end
end
