class EventsController < ApplicationController
  def index
    events = Event.all
    respond_with events
  end

  def show
    event = find_event
    respond_with event
  end

  def create
    event = Event.create event_params
    respond_with event, location: nil
  end

  def update
    event = find_event
    event.update_attributes event_params

    respond_with event
  end

  def destroy
    event = find_event
    event.destroy

    respond_with event
  end

  private

  def event_params
    params.permit(:title, :description)
  end

  def find_event
    Event.find params[:id]
  end
end
