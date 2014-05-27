require 'spec_helper'

describe UsersController do
  describe 'GET index' do
    it "gets a list of all users" do
      allow(User).to receive(:all)

      get :index, format: :json

      expect(User).to have_received(:all)
    end

    it "responds with the users" do
      allow(User).to receive(:all).and_return('users')
      allow(controller).to receive(:respond_with)
      allow(controller).to receive(:render)

      get :index, format: :json

      expect(controller).to have_received(:respond_with).with('users')
    end
  end

  describe 'GET show' do
    it "searches for the user by id" do
      allow(User).to receive(:find)

      get :show, format: :json, id: '1'

      expect(User).to have_received(:find).with('1')
    end

    it "responds with the user" do
      allow(User).to receive(:find).with('1').and_return('user')
      allow(controller).to receive(:respond_with)
      allow(controller).to receive(:render)

      get :show, format: :json, id: '1'

      expect(controller).to have_received(:respond_with).with('user')
    end
  end

  describe 'POST create' do
    it "creates a new user from the given params" do
      allow(User).to receive(:create)

      post :create, valid_user_params.merge(format: :json)

      expect(User).to have_received(:create).with(valid_user_params)
    end

    it "responds with the created user" do
      allow(User).to receive(:create).and_return('user')
      allow(controller).to receive(:respond_with)
      allow(controller).to receive(:render)

      post :create, valid_user_params.merge(format: :json)

      expect(controller).to have_received(:respond_with).with('user', location: nil)
    end
  end

  describe 'PATCH update' do
    let(:user) { double 'user', update_attributes: nil }

    it "searches for the user by id" do
      allow(User).to receive(:find).and_return(user)

      patch :update, valid_user_params.merge(format: :json, id: '1')

      expect(User).to have_received(:find).with('1')
    end

    it "updates the user by the given attributes" do
      allow(User).to receive(:find).with('1').and_return(user)
      allow(user).to receive(:update_attributes)

      patch :update, valid_user_params.merge(format: :json, id: '1')

      expect(user).to have_received(:update_attributes).with(valid_user_params)
    end

    it "responds with the updated user" do
      allow(User).to receive(:find).with('1').and_return(user)
      allow(controller).to receive(:respond_with)
      allow(controller).to receive(:render)

      patch :update, valid_user_params.merge(format: :json, id: '1')

      expect(controller).to have_received(:respond_with).with(user)
    end
  end

  describe 'DELETE destroy' do
    let(:user) { double 'user', destroy: nil }

    it "searches for the user by id" do
      allow(User).to receive(:find).and_return(user)

      delete :destroy, format: :json, id: '1'

      expect(User).to have_received(:find).with('1')
    end

    it "destroys the user" do
      allow(User).to receive(:find).and_return(user)

      delete :destroy, format: :json, id: '1'

      expect(user).to have_received(:destroy)
    end

    it "responds with the destroyed user" do
      allow(User).to receive(:find).with('1').and_return(user)
      allow(controller).to receive(:respond_with)
      allow(controller).to receive(:render)

      delete :destroy, format: :json, id: '1'

      expect(controller).to have_received(:respond_with).with(user)
    end
  end

  def valid_user_params
    {
      first_name: 'Angel',
      last_name: 'Lazarov',
      color: '#12345',
    }
  end
end
