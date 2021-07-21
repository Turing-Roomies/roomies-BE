class Api::V1::RoomieRequestsController < ApplicationController
  def create
    user = User.find(params[:roomie_request][:requestor_id])
    request = user.roomie_requests_as_requestor.new(roomie_params)
    
    if request.duplicate_check
      request.save
      render json: UserSerializer.new(user)
    else
      render json: {error: "request might already exist"}, status: 400
    end
  end

  def destroy
    current_user = User.find(params[:roomie_request][:receiver_id])
    current_user.roomie_requests_as_receiver.find_by(roomie_params).destroy
    render json: UserSerializer.new(current_user)
    

  end

  private

  def roomie_params
    params.permit(:requestor_id, :receiver_id)
  end
end
