require 'rails_helper'

describe 'Users API' do
  describe 'Happy Path' do
    it "returns a 201 status and correct structure response" do
      user_params = ({
                  email: 'testemail@test.com',
                  password: 'test',
                  password_confirmation: 'test'
                })

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('user_login') do
        post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      end
    end
  end
end
