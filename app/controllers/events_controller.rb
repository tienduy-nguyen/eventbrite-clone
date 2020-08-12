class EventsController < ApplicationController

    # GET /events
    def index
      @events = Event.all.take(20)
    end

  # GET events/:id
  def show
    @event = Event.find(params[:id])
  end
    
end
