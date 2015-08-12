class BookUser < ActiveRecord::Base
  include ActivityLog

  belongs_to :book
  belongs_to :user

  after_update :create_favorited_activity
  after_create :create_read_activity

  scope :favorite, -> {where favorite: true}

  private
  def create_read_activity
    create_activity user_id, book_id, Settings.activities.read
  end

  def create_favorited_activity
    create_activity user_id, book_id, Settings.activities.favorited
  end
end
