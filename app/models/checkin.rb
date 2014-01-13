class Checkin < ActiveRecord::Base
  resourcify
  belongs_to :user, dependent: :destroy
  belongs_to :event, dependent: :destroy
end
