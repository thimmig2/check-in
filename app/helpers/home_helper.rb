module HomeHelper
  
  def calculatePoints(checkins)
    @points = 0
    checkins.each do |checkin|
      @points += 25
    end
    @points
  end
    
end
