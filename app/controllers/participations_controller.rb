class ParticipationsController < ApplicationController
  def create
    participation = Participation.create params.permit(:user_id, :event_id)
    respond_with participation, location: nil
  end

  def destroy
    participation = Participation.find params[:id]
    participation.destroy

    respond_with participation
  end
end
