class User < ApplicationRecord
  has_secure_password

  enum gender: [:male, :female, :nonbinary, :other]

  belongs_to :location

  has_many :roomie_requests_as_requestor,
    foreign_key: :requestor_id,
    class_name: :RoomieRequest

  has_many :roomie_requests_as_receiver,
    foreign_key: :receiver_id,
    class_name: :RoomieRequest

  has_many :roomies_as_roomie_a,
      foreign_key: :roomie_a_id,
      class_name: :Roomie

  has_many :roomies_as_roomie_b,
      foreign_key: :roomie_b_id,
      class_name: :Roomie

   has_many :roomie_as, through: :roomies_as_roomie_b
   has_many :roomie_bs, through: :roomies_as_roomie_a

   def all_roomies
      self.roomies_as_roomie_a + self.roomies_as_roomie_b
   end
end
