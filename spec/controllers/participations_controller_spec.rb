require 'spec_helper'

describe ParticipationsController do
  describe "POST create" do
    it "creates a new participation from the given params" do
      allow(Participation).to receive(:create)

      post :create, valid_participations_params

      expect(Participation).to have_received(:create).with(valid_participations_params)
    end

    it "responds with the created participation" do
      allow(Participation).to receive(:create).and_return('participation')

      post :create, valid_participations_params

      expect(controller).to respond_with('participation', location: nil)
    end
  end
  describe "DELETE destroy" do
    let(:participation) { double 'participation', destroy: nil }

    before do
      allow(Participation).to receive(:find).and_return(participation)
    end

    it "searches for the participation by id" do
      delete :destroy, id: '1'
      expect(Participation).to have_received(:find).with('1')
    end

    it "destroys the participation" do
      delete :destroy, id: '1'
      expect(participation).to have_received(:destroy)
    end

    it "responds with the destroyed participation" do
      delete :destroy, id: '1'
      expect(controller).to respond_with(participation)
    end
  end

  def valid_participations_params
    {
      user_id: '1',
      event_id: '1',
    }
  end
end
