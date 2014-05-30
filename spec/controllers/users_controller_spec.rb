require 'spec_helper'

describe UsersController do
  describe "GET index" do
    it "gets a list of all users" do
      allow(User).to receive(:all)

      get :index

      expect(User).to have_received(:all)
    end

    it "responds with the users" do
      allow(User).to receive(:all).and_return('users')

      get :index

      expect(controller).to respond_with('users')
    end
  end

  describe "GET show" do
    it "searches for the user by id" do
      allow(User).to receive(:find)

      get :show, id: '1'

      expect(User).to have_received(:find).with('1')
    end

    it "responds with the user" do
      allow(User).to receive(:find).and_return('user')

      get :show, id: '1'

      expect(controller).to respond_with('user')
    end
  end

  describe "POST create" do
    it "creates a new user from the given params" do
      allow(User).to receive(:create)

      post :create, valid_user_params

      expect(User).to have_received(:create).with(valid_user_params)
    end

    it "responds with the created user" do
      allow(User).to receive(:create).and_return('user')

      post :create, valid_user_params

      expect(controller).to respond_with('user', location: nil)
    end
  end

  describe "PATCH update" do
    let(:user) { double 'user', update_attributes: nil }

    before do
      allow(User).to receive(:find).and_return(user)
    end

    it "searches for the user by id" do
      patch :update, valid_user_params.merge(id: '1')
      expect(User).to have_received(:find).with('1')
    end

    it "updates the user by the given attributes" do
      allow(user).to receive(:update_attributes)

      patch :update, valid_user_params.merge(id: '1')

      expect(user).to have_received(:update_attributes).with(valid_user_params)
    end

    it "responds with the updated user" do
      patch :update, valid_user_params.merge(id: '1')
      expect(controller).to respond_with(user)
    end
  end

  describe "DELETE destroy" do
    let(:user) { double 'user', destroy: nil }

    before do
      allow(User).to receive(:find).and_return(user)
    end

    it "searches for the user by id" do
      delete :destroy, id: '1'
      expect(User).to have_received(:find).with('1')
    end

    it "destroys the user" do
      delete :destroy, id: '1'
      expect(user).to have_received(:destroy)
    end

    it "responds with the destroyed user" do
      delete :destroy, id: '1'
      expect(controller).to respond_with(user)
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
