require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "comment" do
    subject(:comment) {
      Comment.create(
        body: "Lets test comment model"
      )
    }

    it { should belong_to(:post)}
    it { should belong_to(:user)}

    it { should validate_presence_of(:body)}

    it { should have_rich_text(:body)}

  end
end
