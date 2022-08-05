require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "post" do
    subject(:post) { Post.create(
      title: "Test posts",
      body: "this post created for rspec")}

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }

    it { should_not validate_presence_of(:views)}
    it { should_not validate_presence_of(:likes)}

    it { should validate_length_of(:title).is_at_least(5) }
    it { should validate_length_of(:title).is_at_most(50)}

    it { should_not validate_length_of(:title).is_at_least(4)}
    it { should_not validate_length_of(:title).is_at_most(51)}

    it { should have_rich_text(:body)}

    it { should belong_to(:category)}
    it { should belong_to(:user)}

    it { should have_many(:comments)}
    it { should have_many(:likes)}
    it { should have_many(:notifications)}

    it { should have_one(:content)}
  end
end
