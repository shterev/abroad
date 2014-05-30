require 'spec_helper'

describe EventsController do
  describe "GET index" do
    it "gets a list of all events" do
      allow(Event).to receive(:all)

      get :index

      expect(Event).to have_received(:all)
    end

    it "responds with the events" do
      allow(Event).to receive(:all).and_return('events')

      get :index

      expect(controller).to respond_with('events')
    end
  end

  describe "GET show" do
    it "searches for the event by id" do
      allow(Event).to receive(:find)

      get :show, id: '1'

      expect(Event).to have_received(:find).with('1')
    end

    it "responds with the event" do
      allow(Event).to receive(:find).with('1').and_return('event')

      get :show, id: '1'

      expect(controller).to respond_with('event')
    end
  end

  describe "POST create" do
    it "creates a new event from the given params" do
      allow(Event).to receive(:create)

      post :create, valid_event_params

      expect(Event).to have_received(:create).with(valid_event_params)
    end

    it "responds with the created event" do
      allow(Event).to receive(:create).and_return('event')

      post :create, valid_event_params

      expect(controller).to respond_with('event', location: nil)
    end
  end

  describe "PATCH update" do
    let(:event) { double 'event', update_attributes: nil }

    before do
      allow(Event).to receive(:find).and_return(event)
    end

    it "searches for the event by id" do
      patch :update, valid_event_params.merge(id: '1')
      expect(Event).to have_received(:find).with('1')
    end

    it "updates the event by the given attributes" do
      allow(event).to receive(:update_attributes)

      patch :update, valid_event_params.merge(id: '1')

      expect(event).to have_received(:update_attributes).with(valid_event_params)
    end

    it "responds with the updated event" do
      patch :update, valid_event_params.merge(id: '1')
      expect(controller).to respond_with(event)
    end
  end

  describe "DELETE destroy" do
    let(:event) { double 'event', destroy: nil }

    before do
      allow(Event).to receive(:find).and_return(event)
    end

    it "searches for the event by id" do
      delete :destroy, id: '1'
      expect(Event).to have_received(:find).with('1')
    end

    it "destroys the event" do
      delete :destroy, id: '1'
      expect(event).to have_received(:destroy)
    end

    it "responds with the destroyed event" do
      delete :destroy, id: '1'
      expect(controller).to respond_with(event)
    end
  end

  def valid_event_params
    {
      title: 'Holiday',
      description: 'Description',
    }
  end
end
