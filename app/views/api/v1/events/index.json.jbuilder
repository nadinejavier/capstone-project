json.array! @events do |event|
  json.id event.id
  json.title event.title
  json.date event.date
  json.start_time event.start_time
  json.end_time event.end_time
  json.address event.address
  json.description event.description
  json.image event.image
  json.complete event.complete
  json.hosted_by event.hosted_by
  json.created_at event.created_at
  json.updated_at event.updated_at
end