require 'rails_helper'

describe 'Roomie Requests API' do
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

    it "creates a roomie request and returns updated info" do
      user_params = {
                      requestor_id: @current_user.id,
                      receiver_id: @target_user.id
                    }

      headers = {"CONTENT_TYPE" => "application/json"}

      VCR.use_cassette('add_users_roomie_requests') do
        post '/api/v1/roomie_requests', headers: headers, params: user_params.to_json
      end

      user = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(user[:data][:attributes][:roomie_requests_sent][0]).to have_key(:requestor_id)
      expect(user[:data][:attributes][:roomie_requests_sent][0]).to have_key(:receiver_id)
      expect(user[:data][:attributes][:roomie_requests_sent][0]).to have_key(:status)
      expect(user[:data][:attributes][:roomie_requests_sent][0][:requestor_id]).to eq(@current_user.id)
      expect(user[:data][:attributes][:roomie_requests_sent][0][:receiver_id]).to eq(@target_user.id)
      expect(@target_user.roomie_requests_as_receiver.first.requestor_id).to eq(@current_user.id)
      expect(@target_user.roomie_requests_as_receiver.first.receiver_id).to eq(@target_user.id)
    end

    it "deletes a roomie request and returns updated info" do
      user_params = {
                      requestor_id: @target_user.id,
                      receiver_id: @current_user.id
                    }

      headers = {"CONTENT_TYPE" => "application/json"}

      @target_user.roomie_requests_as_requestor.create!(user_params)

      VCR.use_cassette('deletes_users_roomie_requests') do
        delete "/api/v1/roomie_requests/#{@current_user.id}", headers: headers, params: user_params.to_json
      end

      user = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_success
      expect(user[:data][:attributes][:roomie_requests_sent]).to be_empty
      expect(user[:data][:attributes][:roomie_requests_sent]).to be_empty
      expect(user[:data][:attributes][:roomie_requests_sent]).to be_empty
      expect(@current_user.roomie_requests_as_requestor).to be_empty
      expect(@target_user.roomie_requests_as_receiver).to be_empty
      expect(@current_user.roomie_requests_as_requestor[status]).to be_nil
    end
  end
end
