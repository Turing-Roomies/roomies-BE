require 'rails_helper'

describe 'Roomie API' do
  describe 'Happy Path' do
    before :each do
      default_location = Location.create!(city: "n/a", state: "n/a")

      @current_user = User.create!(
                    email: 'testemail@test.com',
                    password: 'test',
                    location: default_location
                  )

      @target_user = User.create!(
                    email: 'testemail1@test.com',
                    password: 'test1',
                    location: default_location
                  )
    end

    it "creates a roomie and returns updated info" do
      user_params = {
                      requestor_id: @current_user.id,
                      receiver_id: @target_user.id
                    }

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('add_users_roomies') do
        post '/api/v1/roomies', headers: headers, params: user_params.to_json
      end

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data][:attributes][:roomies][0]).to have_key(:requestor_id)
      expect(user[:data][:attributes][:roomies][0]).to have_key(:receiver_id)
      expect(user[:data][:attributes][:roomies][0][:requestor_id]).to eq(@current_user.id)
      expect(user[:data][:attributes][:roomies][0][:receiver_id]).to eq(@target_user.id)
      expect(@target_user.all_roomies.first.requestor_id).to eq(@current_user.id)
      expect(@target_user.all_roomies.first.receiver_id).to eq(@target_user.id)
    end

    it "deletes the roomie request if roomie is created" do
      user_params = {
                      requestor_id: @current_user.id,
                      receiver_id: @target_user.id
                    }

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('add_users_roomies_and_delete_associated_request') do
        post '/api/v1/roomies', headers: headers, params: user_params.to_json
      end

      @target_user.roomie_requests_as_receiver.create!(user_params)

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data][:attributes][:roomie_requests_sent]).to be_empty
      expect(user[:data][:attributes][:roomie_requests_received]).to be_empty
    end
  end
end
