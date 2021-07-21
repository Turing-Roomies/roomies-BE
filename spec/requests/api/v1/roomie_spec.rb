require 'rails_helper'

describe 'Roomie API' do
  describe 'Happy Path' do
    before :each do
      default_location = Location.create!(city: "n/a", state: "n/a")

      @current_user = User.create!(
                    email: 'current_user@test.com',
                    password: 'test',
                    location: default_location
                  )

      @target_user = User.create!(
                    email: 'target_user@test.com',
                    password: 'test',
                    location: default_location
                  )
    end

    it "creates a roomie and returns updated info" do
      user_params = {
                      requestor_id: @target_user.id,
                      receiver_id: @current_user.id
                    }

      headers = {"CONTENT_TYPE" => "application/json"}

      @current_user.roomie_requests_as_receiver.create!(user_params)

      VCR.use_cassette('add_users_roomies') do
        post '/api/v1/roomies', headers: headers, params: user_params.to_json
      end

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user[:data][:attributes][:roomies][0]).to have_key(:requestor_id)
      expect(user[:data][:attributes][:roomies][0]).to have_key(:receiver_id)
      expect(user[:data][:attributes][:roomies][0][:receiver_id]).to eq(@current_user.id)
      expect(user[:data][:attributes][:roomies][0][:requestor_id]).to eq(@target_user.id)
      expect(@current_user.all_roomies.first.receiver_id).to eq(@current_user.id)
      expect(@current_user.all_roomies.first.requestor_id).to eq(@target_user.id)
    end

    it "deletes the roomie request if roomie is created" do
      user_params = {
                      requestor_id: @target_user.id,
                      receiver_id: @current_user.id
                    }

      headers = {"CONTENT_TYPE" => "application/json"}

      @current_user.roomie_requests_as_receiver.create!(user_params)

      VCR.use_cassette('add_users_roomies_and_delete_associated_request') do
        post '/api/v1/roomies', headers: headers, params: user_params.to_json
      end

      user = JSON.parse(response.body, symbolize_names: true)

      current_user = User.find(@current_user.id)
      target_user = User.find(@target_user.id)

      expect(user[:data][:attributes][:roomie_requests_sent]).to be_empty
      expect(user[:data][:attributes][:roomie_requests_received]).to be_empty

      expect(current_user.roomie_requests_as_requestor).to eq([])
      expect(current_user.roomie_requests_as_receiver).to eq([])
      expect(target_user.roomie_requests_as_receiver).to eq([])
      expect(target_user.roomie_requests_as_requestor).to eq([])
    end
  end
end
