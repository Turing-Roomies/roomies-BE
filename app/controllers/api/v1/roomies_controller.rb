class Api::V1::RoomiesController < ApplicationController
  def create
    user = User.find(params[:roomie_a_id])
    user.roomies_as_roomie_a.create!(roomie_params)
    render json: UserSerializer.new(user)
  end

  private

  def roomie_params
    params.permit(:roomie_a_id, :roomie_b_id)
  end
end
