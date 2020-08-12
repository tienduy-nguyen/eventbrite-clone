class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  # GET /events
  def index
    @events = Event.all.take(20)
  end

  # GET /events/:id
  def show
    @event = Event.find(params[:id])
    @attendees = Event.attendees_by(params[:id])
  end

  # GET /events/new
  def new 
    @event = Event.new
    @tags = Tag.all
  end

  # POST /events/
  def create
    @event = Event.new(event_params)
    @event.organizer = current_user
    if @event.save
      flash[:success] = "Create event successfully!"
      @tag = Tag.find(params[:tag])
      EventTag.create(tag: @tag, event: @event)
      redirect_to :back
    else
      @event.errors;full_messages.each do |message|
        flash[:error] = message
      end
      render :new
    end

  end

  # GET /events/:id/edit
  def edit
    @events = Event.find(params[:id])
    @tags = Tags.all
    if 
  end

  # PUT events/:id/edit
  def update

  end
    
  private
  def event_params
    params.require(:event).permit(
    :title,
    :start_date,
    :end_date,
    :duration,
    :start_at,
    :price,
    :type,
    :location,
    :img_url,
    :loc_lat,
    :loc_long,
    :category_id,
    :description,
    :organizer_id
    )
  end
end
