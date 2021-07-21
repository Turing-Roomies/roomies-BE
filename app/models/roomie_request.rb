class RoomieRequest < ApplicationRecord
  belongs_to :requestor, class_name: :User
  belongs_to :receiver, class_name: :User

  validate :duplicate_check

  enum status: [:pending, :accepted, :declined]

  def duplicate_check
    existing_request = RoomieRequest.find_by(requestor_id: self.requestor_id, receiver_id: self.receiver_id)

    if !existing_request
      return true
    else
      return false
    end
  end
end
