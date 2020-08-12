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
    @organizers = current_user.organizers
    @types  = Type.all
    @categories  = Category.all
  end

  # POST /events/
  def create
    @event = Event.new(event_params)
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
    if @event.organizer.user.id != current_user.id
      flash[:error] = "Permission denied!"
      redirect_to :back
    end
    @tags = Tags.all
    @organizers = current_user.organizers
    @types  = Type.all
    @categories  = Category.all
  end

  # PUT events/:id/edit
  def update
    if @event.update(event_params)
      flash[:success] = "Update Event Success!"
      redirect_to :back
    else
      @event.errors.full_messages.each do |message|
      flash[:error] = message
      end
      render :edit
    end
  end

  # DELETE /uses/:id
  def destroy
    @event = event.find(params[:id])
    if @event.organizer.user.id != current_user.id
      flash[:error] = "Permission denied!"
      redirect_to :back
    else
      @event.destroy
      redirect_to events_path
    end
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
    :type_id,
    :description,
    :organizer_id,
    :type_location
    )
  end
end
