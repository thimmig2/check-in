class Checkin < ActiveRecord::Base
  resourcify
  validates :user, presence: true
  validates :event, presence: true
  
  belongs_to :user, dependent: :destroy
  belongs_to :event, dependent: :destroy
end
