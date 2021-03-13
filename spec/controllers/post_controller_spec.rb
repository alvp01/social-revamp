require 'rails_helper'

RSpec.describe PostsController do
  let(:u) {User.create! username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
    photo: '', coverimage: '' }

  describe 'GET index' do
    it 'assigns @post' do
      sign_in(u)
      controller.prepend_view_path 'users/index'
      get :create
      expect(assigns(:post)).to be_a(Object)
      expect(assigns(:post).text).to eq(nil)
    end

    it 'assigns @timeline_posts' do
      sign_in(u)
      p = Post.new({ user_id: u.id, content: 'post content' })
      p.save
      get :index
      expect(assigns(:timeline_posts)).to be_a(Object)
      expect(assigns(:timeline_posts).count).to eq(1)
    end

    it 'renders the index template' do
      sign_in(u)
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'POST create' do
    it 'assigns @post' do
      sign_in(u)
      post :create, { params: { post: { content: 'hello' } } }
      expect(assigns(:post).user_id).to eq(u.id)
    end

    it 'redirects to posts index' do
      sign_in(u)
      post :create, { params: { post: { content: 'hello' } } }
      expect(response).to redirect_to(posts_path)
    end
  end
end