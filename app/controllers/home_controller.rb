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
    checkins.each do |checkin|
      @points += 25
    end
    @points
  end
  
end