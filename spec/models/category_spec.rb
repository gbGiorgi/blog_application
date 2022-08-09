# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'category' do
    subject(:category) do
      Category.create(
        name: 'Computer',
        display_in_nav: true
      )
    end

    it { should have_many(:posts) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
