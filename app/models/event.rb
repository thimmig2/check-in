class Event < ActiveRecord::Base
  resourcify
  has_many :checkins
end
