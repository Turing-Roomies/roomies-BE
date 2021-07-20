require 'rails_helper'
describe Location, type: :model do
  describe "Validations" do
    it {should validate_presence_of :state}
    it {should validate_presence_of :city}
  end
  describe 'relationships' do
    it {should have_many(:users)}
  end
end