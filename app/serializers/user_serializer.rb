class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email,
             :name,
             :gender,
             :age,
             :location,
             :roomie_requests_sent,
             :roomie_requests_received,
             :roomies

  attribute :location do |object|
    {
      city: object.location.city,
      state: object.location.state
    }
  end

  attribute :roomie_requests_sent do |object|
    object.roomie_requests_as_requestor.each do |roomie|
      {
        receiver_id: roomie.receiver_id
      }
    end
  end

  attribute :roomie_requests_received do |object|
    object.roomie_requests_as_receiver.each do |roomie|
      {
        requestor_id: roomie.requestor_id
      }
    end
  end

  attribute :roomies do |object|
    object.all_roomies.each do |roomie|
    end
  end
end
