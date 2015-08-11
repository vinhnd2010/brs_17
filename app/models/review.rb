class Review < ActiveRecord::Base
  include ActivityLog

  belongs_to :book
  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :content, presence: true, length: {minimum: Settings.validates.review.minlength,
    too_short: I18n.t("flash.validates.tooshort", count: count)}

  after_save :create_reviewed_activity, :set_avarage_rating

  scope :latest, ->{order updated_at: :desc}

  private
  def set_avarage_rating
    rate = self.book.reviews.average :score
    book.update_attributes rate: rate
  end

  def create_reviewed_activity
    create_activity user_id, book_id, Settings.activities.reviewed
  end
end
