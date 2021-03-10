require 'rails_helper'

RSpec.describe UsersController do
  describe 'GET index' do
    it 'assigns @groups' do
      u = User.create!({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                     photo: '', coverimage: '' })
      u.save
      sign_in(u)
      get :index
      expect(assigns(:groups)).to be_a(Object)
      expect(assigns(:groups)).to eq([])
    end

    it 'assigns @group' do
      u = User.create!({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                     photo: '', coverimage: '' })
      u.save
      sign_in(u)
      get :index
      expect(assigns(:group)).to be_a(Object)
    end

    it 'assigns @post' do
      u = User.create!({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                     photo: '', coverimage: '' })
      u.save
      sign_in(u)
      get :index
      expect(assigns(:post)).to be_a(Object) 
    end

    it 'assigns @comment' do
      u = User.create!({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                     photo: '', coverimage: '' })
      u.save
      sign_in(u)
      get :index
      expect(assigns(:comment)).to be_a(Object) 
    end

    it 'renders the index template' do
      u = User.create!({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                     photo: '', coverimage: '' })
      sign_in(u)
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'assigns @user' do
      u = User.create!({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                     photo: '', coverimage: '' })
      u.save
      sign_in(u)
      get :show, { params: { username: u.username } }
      expect(assigns(:user)).to be_a(Object)
      expect(assigns(:user)).to eq(u)
    end

    it 'assigns @posts' do
      u = User.create!({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                     photo: '', coverimage: '' })
      u.save
      sign_in(u)
      get :show, { params: { username: u.username } }
      expect(assigns(:posts)).to be_a(Object)
      expect(assigns(:posts)).to eq([])
    end

    it 'renders the show template' do
      u = User.create!({ username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                     photo: '', coverimage: '' })
      u.save
      sign_in(u)
      get :show, { params: { username: u.username } }
      expect(response).to render_template('show')
    end
  end
end