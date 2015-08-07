module ActivityLog
  def create_activity user_id, target_id, content
    Activity.create! user_id: user_id, target_id: target_id, content: content
  end
end
