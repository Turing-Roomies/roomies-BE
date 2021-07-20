class Api::V1::RoomiesController < ApplicationController
  def create
    user = User.find(params[:requestor_id])
    user.roomies_as_requestor.create!(roomie_params)
    render json: UserSerializer.new(user)
  end

  private

  def roomie_params
    params.permit(:requestor_id, :receiver_id)
  end
end
