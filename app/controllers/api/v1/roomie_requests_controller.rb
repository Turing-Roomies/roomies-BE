class Api::V1::RoomieRequestsController < ApplicationController
  def create
    user = User.find(params[:roomie_request][:requestor_id])
    user.roomie_requests_as_requestor.create!(roomie_params)

    render json: UserSerializer.new(user)
  end

  def destroy
    current_user = User.find(params[:roomie_request][:receiver_id])
    current_user.roomie_requests_as_receiver.find_by(roomie_params).destroy
    render json: UserSerializer.new(current_user)
    # else
    #   render json: {error: "roomie requests doesn't exist"}, status: 400
    # end

  end

  private

  def roomie_params
    params.permit(:requestor_id, :receiver_id)
  end
end
