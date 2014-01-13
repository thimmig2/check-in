class Event < ActiveRecord::Base
  resourcify
  has_many :checkins, dependent: :destroy
end
