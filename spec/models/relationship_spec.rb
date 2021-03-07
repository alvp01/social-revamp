require 'rails_helper'

RSpec.describe Relationship, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      u = User.new
      expect(u).to be_a(Object)
    end
  end

  context 'Validates data' do
    it 'users cannot follow same user twice' do
      u1 = User.create({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456', photo: '', coverimage: '' })
      u2 = User.create({ username: 'herpus', fullname: 'Herpos Maximus', email: 'herpo@herp.com', password: '123456', photo: '', coverimage: '' })
      r1 = Relationship.create({ follower_id: u1.id, followed_id: u2.id })
      r2 = Relationship.new({ follower_id: u1.id, followed_id: u2.id })
      expect(r2.valid?).to be_falsy
    end
  end
end