require 'rails_helper'

describe 'Sessions API' do
  describe 'Happy Path' do
    it "returns correct user data in the correct structure" do
      user_params = {
                      email: 'testemail@test.com',
                      password: 'test',
                    }

      headers = {"CONTENT_TYPE" => "application/json"}

      defualt_location = Location.create!(city: "n/a", state: "n/a")

      User.create!(
                    email: 'testemail111@test.com',
                    password: 'test',
                    location: defualt_location
                  )

      VCR.use_cassette('user_login') do
        post '/api/v1/sessions', headers: headers, params: user_params.to_json
      end

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data]).to have_key(:id)
      expect(user[:data]).to have_key(:type)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes]).to have_key(:api_key)
    end
  end
end
