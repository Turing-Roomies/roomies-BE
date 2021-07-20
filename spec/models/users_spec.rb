require 'rails_helper'
describe User, type: :model do
  describe "Validations" do
    it {should validate_presence_of :email}
    it {should validate_presence_of :password}
    it {should validate_uniqueness_of(:email).on(:create)}
  end
  
  describe 'relationships' do
    it {should belong_to(:location)}
    it {should have_many(:roomie_requests_as_requestor)}
    it {should have_many(:roomie_requests_as_receiver)}
    it {should have_many(:roomies_as_requestor)}
    it {should have_many(:roomies_as_receiver)}
    it {should have_many(:receivers).through(:roomies_as_requestor)}
    it {should have_many(:requestors).through(:roomies_as_receiver)}
  end

  describe "email format" do
    it "create a user with a valid email format" do
      default_location = Location.create!(city: "n/a", state: "n/a")
      user = User.create!(email: 'harrison@email.com', password: 'password', location: default_location)
      expect(user.email).to eq('harrison@email.com')
    end
    it "should not create a user with a invalid email format" do
      user = User.new(email: 'harrison', password: 'password')
      expect(user.save).to eq(false)
    end
  end
end