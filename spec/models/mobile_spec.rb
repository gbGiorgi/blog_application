require 'rails_helper'

RSpec.describe Mobile, type: :model do
  describe "mobile" do
    subject(:mobile) { Mobile.create(
      number: '574482992',
      country: 'GE' )}

    it { should belong_to(:user)}
  end
end
