require 'rails_helper'

RSpec.describe Group, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      g = Group.new
      expect(g).to be_a(Object)
    end

    it 'assigns the values passed' do
      u = User.create({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456', photo: '', coverimage: '' })
      g = Group.new({ group_name: 'derpus', group_description: 'Derpos Maximus', creator_id: u.id, cover_image: '' })
      expect(g.group_name).to eql('derpus')
    end
  end

  context 'Testing validations' do
    it 'validates the object without attributes to be invalid' do
      g = Group.new
      expect(g.valid?).to be_falsy
    end

    it 'validates the object to have proper attributes to be valid' do
      u = User.create({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456', photo: '', coverimage: '' })
      g = Group.new({ group_name: 'derpus', group_description: 'Derpos Maximus', creator_id: u.id, cover_image: '' })
      expect(g.valid?).to be_truthy
    end

    it 'validates group name uniqueness' do
      u = User.create({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456', photo: '', coverimage: '' })
      g = Group.create({ group_name: 'derpus', group_description: 'Derpos Maximus', creator_id: u.id, cover_image: '' })
      h = Group.new({ group_name: 'derpus', group_description: 'Derpo 2', creator_id: u.id, cover_image: '' })
      expect(h.valid?).to be_falsy
    end
  end

  context 'Testing associations' do
    it 'has many discussions' do
      g = Group.new
      expect(g.discussions).to be_a(Object)
    end

    it 'has many members' do
      g = Group.new
      expect(g.members).to be_a(Object)
    end

    it 'has an creator' do
      g = Group.new
      expect(g.creator).to be_a(Object)
    end
  end
end