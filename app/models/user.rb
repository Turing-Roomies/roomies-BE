class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true
  has_secure_password

  enum gender: [:male, :female, :nonbinary, :other]

  belongs_to :location

  has_many :roomie_requests_as_requestor,
    foreign_key: :requestor_id,
    class_name: :RoomieRequest

  has_many :roomie_requests_as_receiver,
    foreign_key: :receiver_id,
    class_name: :RoomieRequest

  has_many :roomies_as_requestor,
      foreign_key: :requestor_id,
      class_name: :Roomie

  has_many :roomies_as_receiver,
      foreign_key: :receiver_id,
      class_name: :Roomie

  has_many :requestors, through: :roomies_as_receiver
  has_many :receivers, through: :roomies_as_requestor

  def all_roomies
      self.roomies_as_requestor + self.roomies_as_receiver
  end
end
