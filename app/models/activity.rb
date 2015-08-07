class Activity < ActiveRecord::Base
  belongs_to :user

  has_many :likes, dependent: :destroy

  validates :user, presence: true
  validates :target_id, presence: true
  validates :content, presence: true
end
