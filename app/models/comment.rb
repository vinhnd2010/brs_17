class Comment < ActiveRecord::Base
  belongs_to :review
  belongs_to :user

  validates :content, presence: true, length: {minimum: 10,
    too_short: "must have at least %{count} words"}
end
