require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "like" do
    it { should belong_to(:post)}
    it { should belong_to(:user)}
  end
end
