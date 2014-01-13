class EventsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  
  
  # GET /events
  # GET /events.json
  def index
    authorize! :index, @event, :message => 'Not authorized as an administrator.'
    @events = Event.find(:all, order: "created_at DESC")
    @event = Event.new
  end
  
  def show
    authorize! :index, @event, :message => 'Not authorized as an administrator.'
    @event = Event.find(params[:id])
    @checkins = @event.checkins
    @checkins.sort! do |a,b| 
      a.user.name.downcase <=> b.user.name.downcase
    end
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Hash.new
    @event[:name] = params[:event][:name]
    @event[:type_id] = params[:event][:type_id]
    @event = Event.create(@event)

    respond_to do |format|
      format.html { redirect_to action: "index"}
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    authorize! :index, @event, :message => 'Not authorized as an administrator.'
    @event.update(event_params)
    respond_to do |format|
      format.html { redirect_to action: "index"}
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    authorize! :index, @event, :message => 'Not authorized as an administrator.'
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :date_held, :type_id)
    end
end
