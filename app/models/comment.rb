class Comment < ActiveRecord::Base
  include ActivityLog

  belongs_to :review
  belongs_to :user

  validates :content, presence: true, length: {minimum: Settings.validates.comment.minlength,
    too_short: I18n.t("flash.validates.tooshort", count: count)

  after_save :create_commented_activity

  private
  def create_commented_activity
    create_activity user_id, review_id, Settings.activities.commented
  end
end
