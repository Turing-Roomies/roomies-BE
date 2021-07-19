class Roomie < ApplicationRecord
  belongs_to :roomie_a, class_name: :User
  belongs_to :roomie_b, class_name: :User
end
