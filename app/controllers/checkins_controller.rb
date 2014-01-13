class CheckinsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_checkin, only: [:show, :edit, :update, :destroy]
  

  # GET /checkins
  # GET /checkins.json
  def index
    authorize! :index, @checkin, :message => 'Not authorized as an administrator.'
    @checkins = Checkin.all.sort do |a,b| 
      (a.event.created_at <=> b.event.created_at) * -1
    end
    @checkin = Checkin.new
  end

  # POST /checkins
  # POST /checkins.json
  def create
    @newCheckin = Checkin.create(params[:checkin].permit(:user_id, :event_id))
    respond_to do |format|
      format.html { redirect_to request.referer }
    end
  end

  # DELETE /checkins/1
  # DELETE /checkins/1.json
  def destroy
    authorize! :index, @checkin, :message => 'Not authorized as an administrator.'
    @checkin.destroy
    respond_to do |format|
      format.html { redirect_to request.referer }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checkin
      @checkin = Checkin.find(params[:id])
    end

end
