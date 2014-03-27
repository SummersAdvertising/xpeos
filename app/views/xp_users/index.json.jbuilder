json.array!(@xp_users) do |xp_user|
  json.extract! xp_user, :id, :name, :phone, :email, :address, :fb_user_id, :fb_share_id, :access_token
  json.url xp_user_url(xp_user, format: :json)
end
