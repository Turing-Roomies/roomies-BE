class Api::V1::RoomieRequestsController < ApplicationController
  def create
    user = User.find(params[:roomie_request][:requestor_id])
    user.roomie_requests_as_requestor.create!(roomie_params)

    render json: UserSerializer.new(user)
  end

  def destroy
    user = User.find(params[:roomie_request][:requestor_id])
    user.roomie_requests_as_requestor.find_by(roomie_params).destroy
    render json: UserSerializer.new(user)
  end

  private

  def roomie_params
    params.permit(:requestor_id, :receiver_id, :status)
  end
end
