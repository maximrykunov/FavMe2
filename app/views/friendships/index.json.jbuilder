json.array! @friendships do |friendship|
  json.id friendship.id
  json.friend_id friendship.friend_id
  json.friend_name friendship.friend.name
  json.state friendship.state
  json.message friendship.message
end