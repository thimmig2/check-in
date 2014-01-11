json.array!(@checkins) do |checkin|
  json.extract! checkin, :id, :user_id, :event_id
  json.url checkin_url(checkin, format: :json)
end
