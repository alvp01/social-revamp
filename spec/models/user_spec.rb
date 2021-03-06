require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      u = User.new
      expect(u).to be_a(Object)
    end

    it 'assigns the values passed' do
      u = User.new({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456', photo: '', coverimage: '' })
      expect(u.username).to eql('derpus')
    end
  end

  context 'Testing validations' do
    it 'validates the object without attributes to be invalid' do
      u = User.new
      expect(u.valid?).to be_falsy
    end

    it 'validates the object to have proper attributes to be valid' do
      u = User.new({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456', photo: '', coverimage: '' })
      expect(u.valid?).to be_truthy
    end

    it 'validates email uniqueness' do
      x = User.new({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456', photo: '', coverimage: '' })
      x.save
      u = User.new({ username: 'herpus', fullname: 'Herpos Maximus', email: 'derpo@derp.com', password: '123456', photo: '', coverimage: '' })
      expect(u.valid?).to be_falsy
    end

    it 'validates username uniqueness' do
      x = User.new({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456', photo: '', coverimage: '' })
      x.save
      u = User.new({ username: 'derpus', fullname: 'Herpos Maximus', email: 'derpo@derp.com', password: '123456', photo: '', coverimage: '' })
      expect(u.valid?).to be_falsy
    end
  end

  context 'Testing associations' do
    it 'has many posts' do
      u = User.new
      expect(u.posts).to be_a(Object)
    end

    it 'has many comments' do
      u = User.new
      expect(u.comments).to be_a(Object)
    end

    it 'has many discussions' do
      u = User.new
      expect(u.discussions).to be_a(Object)
    end

    it 'has many followees' do
      u = User.new
      expect(u.followees).to be_a(Object)
    end

    it 'has many followers' do
      u = User.new
      expect(u.followers).to be_a(Object)
    end

    it 'has many created groups' do
      u = User.new
      expect(u.created_groups).to be_a(Object)
    end

    it 'has many groups' do
      u = User.new
      expect(u.groups).to be_a(Object)
    end
  end
end