require 'rails_helper'
describe Roomie, type: :model do
  describe 'relationships' do
    it {should belong_to(:requestor)}
    it {should belong_to(:receiver)}
  end
end