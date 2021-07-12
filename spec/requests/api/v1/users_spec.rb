require 'rails_helper'

describe 'Users API' do
  describe 'Happy Path' do
    it "returns user data in the correct structure" do

      defualt_location = Location.create!(city: "n/a", state: "n/a")

      User.create!(
                    email: 'testemail@test.com',
                    password: 'test',
                    location: defualt_location
                  )

      User.create!(
                    email: 'testemail1@test.com',
                    password: 'test1',
                    location: defualt_location
                  )

      VCR.use_cassette('return_all_users') do
        get '/api/v1/users'
      end

      users = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success

      expect(users).to be_a(Hash)
      expect(users).to have_key(:data)
      expect(users[:data]).to be_a(Array)
      expect(users[:data][0]).to be_a(Hash)
      expect(users[:data][0]).to have_key(:id)
      expect(users[:data][0]).to have_key(:type)
      expect(users[:data][0]).to have_key(:attributes)
      expect(users[:data][0][:attributes]).to have_key(:email)
      expect(users[:data][0][:attributes]).to have_key(:name)
      expect(users[:data][0][:attributes]).to have_key(:gender)
      expect(users[:data][0][:attributes]).to have_key(:age)
      expect(users[:data][0][:attributes]).to have_key(:location)
      expect(users[:data][0][:attributes][:location]).to have_key(:city)
      expect(users[:data][0][:attributes][:location]).to have_key(:state)
    end
  end
end
