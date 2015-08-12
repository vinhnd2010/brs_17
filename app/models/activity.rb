class Activity < ActiveRecord::Base
  belongs_to :user

  has_many :likes, dependent: :destroy

  validates :user, presence: true
  validates :target_id, presence: true
  validates :content, presence: true

  scope :latest, ->{order updated_at: :desc}

  def create_activity target_id, content
    case content
    when Settings.activities.followed, Settings.activities.unfollowed
      "#{Settings.activities.user} #{User.find_by(id: target_id).name}"
    when Settings.activities.reviewed
      "#{Settings.activities.book} #{Book.find_by(id: target_id).title}"
    when Settings.activities.commented
      "#{Settings.activities.user} #{Review.find_by(id: target_id).content.truncate 100}"
    end
  end
end
