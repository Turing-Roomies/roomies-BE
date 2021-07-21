class Api::V1::RoomiesController < ApplicationController
  def create
    user = User.find(params[:receiver_id])
    user.roomies_as_receiver.create!(roomie_params)

    request = user.roomie_requests_as_receiver.find_by(roomie_params)
    user.roomie_requests_as_receiver.destroy(request.id)

    render json: UserSerializer.new(user)
  end

  private

  def roomie_params
    params.permit(:requestor_id, :receiver_id)
  end
end
