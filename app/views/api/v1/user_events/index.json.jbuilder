json.array! @user_events do |user_event|
  json.id user_event.id
  json.user_id user_event.user_id
  json.event_id user_event.event_id
end