require 'rails_helper'

RSpec.describe Discussion, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      d = Discussion.new
      expect(d).to be_a(Object)
    end

    it 'assigns the values passed' do
      d = Discussion.new({ text: 'My crazy post' })
      expect(d.text).to eql('My crazy post')
    end
  end

  context 'Testing validations' do
    it 'validates the object without attributes to be invalid' do
      d = Discussion.new
      expect(d.valid?).to be_falsy
    end

    it 'validates the object to have proper attributes to be valid' do
      u = User.create({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                        photo: '', coverimage: '' })
      g = Group.create({ group_name: 'derpus', group_description: 'Derpos Maximus', creator_id: u.id, cover_image: '' })
      d = Discussion.new({ text: 'My nice post', AuthorId: u.id, group_id: g.id })
      expect(d.valid?).to be_truthy
    end

    it 'validates content presence' do
      u = User.create({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                        photo: '', coverimage: '' })
      g = Group.create({ group_name: 'derpus', group_description: 'Derpos Maximus', creator_id: u.id, cover_image: '' })
      d = Discussion.new({ AuthorId: u.id, group_id: g.id })
      expect(d.valid?).to be_falsy
    end
  end

  context 'Testing associations' do
    it 'belongs to a user' do
      d = Discussion.new
      expect(d.author).to be_a(Object)
    end

    it 'has many comments' do
      d = Discussion.new
      expect(d.comments).to be_a(Object)
    end

    it 'belongs to a group' do
      d = Discussion.new
      expect(d.group).to be_a(Object)
    end
  end
end
