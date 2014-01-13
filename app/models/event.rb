class Event < ActiveRecord::Base
  resourcify
  validates :name, presence: true
  validates :type_id, presence: true
  
  has_many :checkins
end
