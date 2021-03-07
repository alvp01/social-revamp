require 'rails_helper'

RSpec.describe GroupRegistration, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      r = GroupRegistration.new
      expect(r).to be_a(Object)
    end
  end

  context 'Validates data' do
    it 'valid if the registration has a group and a member' do
      u = User.create({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                        photo: '', coverimage: '' })
      g = Group.create({ group_name: 'derpus', group_description: 'Derpos Maximus', creator_id: u.id, cover_image: '' })
      r = GroupRegistration.new({ member_id: u.id, group_id: g.id })
      expect(r.valid?).to be_truthy
    end

    it 'invalid if the registration has not a group' do
      u = User.create({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                        photo: '', coverimage: '' })
      r = GroupRegistration.new({ member_id: u.id })
      expect(r.valid?).to be_falsy
    end

    it 'invalid if the registration has not a member' do
      u = User.create({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                        photo: '', coverimage: '' })
      g = Group.create({ group_name: 'derpus', group_description: 'Derpos Maximus', creator_id: u.id, cover_image: '' })
      r = GroupRegistration.new({ group_id: g.id })
      expect(r.valid?).to be_falsy
    end
  end
end
