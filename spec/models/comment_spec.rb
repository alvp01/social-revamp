require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'Initiating object' do
    it 'creates a new object' do
      c = Comment.new
      expect(c).to be_a(Object)
    end

    it 'assigns the values passed' do
      c = Comment.new({ text: 'My crazy post' })
      expect(c.text).to eql('My crazy post')
    end
  end

  context 'Testing validations' do
    it 'validates the object without attributes to be invalid' do
      c = Comment.new
      expect(c.valid?).to be_falsy
    end

    it 'validates the object to have proper attributes to be valid (post)' do
      u = User.create({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456', photo: '', coverimage: '' })
      p = Post.create({ text: 'My nice post', AuthorId: u.id })
      c = Comment.new({ text: 'My nice comment', AuthorId: u.id, commentable_id: p.id, commentable_type: 'Post' })
      expect(c.valid?).to be_truthy
    end

    it 'validates the object to have proper attributes to be valid (discussion)' do
      u = User.create({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456', photo: '', coverimage: '' })
      g = Group.create({ group_name: 'derpus', group_description: 'Derpos Maximus', creator_id: u.id, cover_image: '' })
      d = Discussion.create({ text: 'My nice post', AuthorId: u.id, group_id: g.id })
      c = Comment.new({ text: 'My nice comment', AuthorId: u.id, commentable_id: d.id, commentable_type: 'Discussion' })
      expect(c.valid?).to be_truthy
    end

    it 'validates text presence' do
      u = User.create({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456', photo: '', coverimage: '' })
      p = Post.create({ text: 'text here' ,AuthorId: u.id })
      c = Comment.new({ AuthorId: u.id, commentable_id: p.id, commentable_type: 'Post' })
      expect(c.valid?).to be_falsy
    end
  end

  context 'Testing associations' do
    it 'belongs to a user' do
      c = Comment.new
      expect(c.author).to be_a(Object)
    end

    it 'belong to a post or a discussion' do
      c = Comment.new
      expect(c.commentable).to be_a(Object)
    end
  end
end