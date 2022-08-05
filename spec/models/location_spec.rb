require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "location" do
    subject(:location) { Location.create(
      street: "kostavas 84",
      city: "kutaisi",
      state: "imereti",
      country: "georgia" )}

    it { should belong_to(:user)}

    it { should validate_presence_of(:latitude)}
    it { should validate_presence_of(:longitude)}
    it { should validate_presence_of(:street)}
    it { should validate_presence_of(:city)}
    it { should validate_presence_of(:state)}
    it { should validate_presence_of(:country)}


    context 'methods' do
      let(:address) { "kostavas 84, kutaisi, imereti, georgia" }
      let(:coordinates) { [0.422727036e2, 0.42706738e2] }

      it "address" do
        expect(location.address).to eq(address)
      end

      it "coordinates" do
        expect(location.coordinates).to eq(coordinates)
      end
    end
  end
end
