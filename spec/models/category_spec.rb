require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "category" do
    subject(:category) {
      Category.create(
        name: "Computer",
        display_in_nav: true
      )
    }

    it { should have_many(:posts)}
    it { should validate_presence_of(:name)}
    it { should validate_uniqueness_of(:name)}
  end
end
