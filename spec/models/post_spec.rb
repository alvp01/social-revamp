require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      p = Post.new
      expect(p).to be_a(Object)
    end

    it 'assigns the values passed' do
      p = Post.new({ text: 'My crazy post' })
      expect(p.text).to eql('My crazy post')
    end
  end

  context 'Testing validations' do
    it 'validates the object without attributes to be invalid' do
      p = Post.new
      expect(p.valid?).to be_falsy
    end

    it 'validates the object to have proper attributes to be valid' do
      u = User.create({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                        photo: '', coverimage: '' })
      p = Post.new({ text: 'My nice post', AuthorId: u.id })
      expect(p.valid?).to be_truthy
    end

    it 'validates content presence' do
      u = User.create({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                        photo: '', coverimage: '' })
      p = Post.new({ AuthorId: u.id })
      expect(p.valid?).to be_falsy
    end
  end

  context 'Testing associations' do
    it 'belongs to a user' do
      p = Post.new
      expect(p.author).to be_a(Object)
    end

    it 'has many comments' do
      p = Post.new
      expect(p.comments).to be_a(Object)
    end
  end
end
