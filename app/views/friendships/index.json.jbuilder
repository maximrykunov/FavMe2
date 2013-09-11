json.array! @friendships do |friendship|
  json.id friendship.id
  json.friend_id friendship.friend_user(current_user).id
  json.friend_name friendship.friend_user(current_user).name
  json.state friendship.state
  json.message friendship.message
end