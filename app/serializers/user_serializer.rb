class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :name, :gender, :age, :location

  attribute :location do |object|
    {
      city: object.location.city,
      state: object.location.state
    }
  end
end
