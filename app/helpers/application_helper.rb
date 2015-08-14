module ApplicationHelper
  def full_title page_title = ""
    base_title = t "static_page.brs"
    page_title.empty? ? base_title : page_title << " | " << base_title
  end

  def link_to_add_fields name, f, type
    new_object = f.object.send "build_#{type}"
    id = "new_#{type}"
    fields = f.send "#{type}_fields", new_object, child_index: id do |builder|
      render type.to_s + "_fields", f: builder
    end
    link_to name, "#", class: "add_fields btn btn-success",
      data: {id: id, fields: fields.gsub("\n", "")}
  end

  def action_type book_user
    if book_user
      book_user.favorite? ? Settings.book_users.unfavorited : Settings.book_users.favorited
    else
      Settings.book_users.favorited
    end
  end

  def like_status user, activity
    like = Like.find_by user_id: user.id, activity_id: activity.id
    like && like.status?
  end

  def like_type user, activity
    like = Like.find_by user_id: user.id, activity_id: activity.id
    if like
      like.status? ? Settings.likes.unlike : Settings.likes.like
    else
      Settings.likes.like
    end
  end
end
