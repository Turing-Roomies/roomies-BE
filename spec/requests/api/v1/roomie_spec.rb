require 'rails_helper'

describe 'Roomie API' do
  describe 'Happy Path' do
    before :each do
      defualt_location = Location.create!(city: "n/a", state: "n/a")

      @current_user = User.create!(
                    email: 'testemail@test.com',
                    password: 'test',
                    location: defualt_location
                  )

      @target_user = User.create!(
                    email: 'testemail1@test.com',
                    password: 'test1',
                    location: defualt_location
                  )
    end
    it "creates a roomie and returns updated info" do
      roomie_params = {
                      roomie_a_id: @current_user.id,
                      roomie_b_id: @target_user.id,
                      status: "accepted"
                    }

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('add_users_roomies') do
        post '/api/v1/roomies', headers: headers, params: roomie_params.to_json
      end

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data][:attributes][:roomies][0]).to have_key(:roomie_a_id)
      expect(user[:data][:attributes][:roomies][0]).to have_key(:roomie_b_id)
      expect(user[:data][:attributes][:roomies][0][:roomie_a_id]).to eq(@current_user.id)
      expect(user[:data][:attributes][:roomies][0][:roomie_b_id]).to eq(@target_user.id)
    end
  end
end
