class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @username = current_user.name
    @checkins = Checkin.where(user_id: current_user.id).sort do |a,b| 
      a.user.name.downcase <=> b.user.name.downcase
    end
    @points = calculatePoints(@checkins)
    respond_to do |format|
      format.html  # index.html.erb
    end
  end

  private
  
  def calculatePoints(checkins)
    @points = 0
    @types = Hash.new
    checkins.each do |checkin|
      
      @types[checkin.event.type_id] = 0 unless @types.has_key? checkin.event.type_id
      
      if checkin.event.type_id == "Distinction"
        @points += 60
      else
        @points += 25 - (5 * @types[checkin.event.type_id]) unless @types[checkin.event.type_id] == 3
      end
      
      @types[checkin.event.type_id] += 1;
        
    end
    @points
  end
  
end