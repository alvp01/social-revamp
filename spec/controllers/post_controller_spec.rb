require 'rails_helper'

RSpec.describe PostsController do
  let(:u) do
    User.create! username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                 photo: '', coverimage: ''
  end

  describe 'POST create' do
    it 'assigns @post text' do
      sign_in(u)
      post :create, { params: { post: { text: 'hello' } } }
      expect(assigns(:post)).to be_a(Object)
      expect(assigns(:post).text).to eq('hello')
    end

    it 'assigns @post author id' do
      sign_in(u)
      post :create, { params: { post: { text: 'hello' } } }
      expect(assigns(:post)).to be_a(Object)
      expect(assigns(:post).AuthorId).to eq(u.id)
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the post' do
      sign_in(u)
      user_post = Post.create(AuthorId: u.id, text: 'henlo')
      expect do
        delete :destroy, params: { id: user_post.id }
      end.to change(Post, :count).by(-1)
    end
  end
end
