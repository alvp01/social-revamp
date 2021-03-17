require 'rails_helper'

RSpec.describe GroupsController do
  let(:u) do
    User.create! username: 'derpus', fullname: 'Derpos Maximus', email: 'derpo@derp.com', password: '123456',
                 photo: '', coverimage: ''
  end

  describe 'GET new' do
    it 'gets the new template' do
      sign_in(u)
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns the new group' do
      sign_in(u)
      get :new
      expect(assigns(:group)).to be_a(Object)
      expect(assigns(:group).id).to eq(nil)
    end
  end

  describe 'POST create' do
    it 'creates the group' do
      sign_in(u)
      post :create, { params: { group: { creator_id: u.id, group_name: 'derps', group_description: 'henlo' } } }
      expect(assigns(:new_group)).to be_a(Object)
      expect(assigns(:new_group).group_name).to eq('derps')
      expect(assigns(:new_group).creator).to eq(u)
    end

    it 'redirects to group page if succeeds' do
      sign_in(u)
      post :create, { params: { group: { creator_id: u.id, group_name: 'derps', group_description: 'henlo' } } }
      expect(response).to redirect_to(assigns(:new_group))
    end

    it 'redirects to root path if fails' do
      sign_in(u)
      post :create, { params: { group: { creator_id: u.id, group_name: 'derps' } } }
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'GET show' do
    it 'assigns the current group' do
      sign_in(u)
      g = Group.create(creator_id: u.id, group_name: 'derps', group_description: 'henlo')
      get :show, { params: { id: g.id } }
      expect(assigns(:current_group).group_name).to eq('derps')
      expect(assigns(:current_group).id).to eq(g.id)
    end

    it 'assigns the current group members' do
      sign_in(u)
      g = Group.create(creator_id: u.id, group_name: 'derps', group_description: 'henlo')
      get :show, { params: { id: g.id } }
      expect(assigns(:members)).to be_a(Object)
      expect(assigns(:members)).to eq([])
    end

    it 'assigns the current group creator' do
      sign_in(u)
      g = Group.create(creator_id: u.id, group_name: 'derps', group_description: 'henlo')
      get :show, { params: { id: g.id } }
      expect(assigns(:creator)).to be_a(Object)
      expect(assigns(:creator)).to eq(u)
    end

    it 'assigns the current group discussion' do
      sign_in(u)
      g = Group.create(creator_id: u.id, group_name: 'derps', group_description: 'henlo')
      get :show, { params: { id: g.id } }
      expect(assigns(:discussion)).to be_a(Object)
      expect(assigns(:discussion).id).to eq(nil)
    end
  end

  describe 'DELETE destroy' do
    it 'deletes the group' do
      sign_in(u)
      current_group = Group.create(creator_id: u.id, group_name: 'derps', group_description: 'henlo')
      expect do
        delete :destroy, params: { id: current_group.id }
      end.to change(Group, :count).by(-1)
    end
  end
end
