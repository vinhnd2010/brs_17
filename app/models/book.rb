class Book < ActiveRecord::Base
  include Bootsy::Container

  belongs_to :category

  has_many :users, through: :book_users
  has_many :book_users, dependent: :destroy
  has_many :reviews, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: :slugged

  mount_uploader :cover, CoverUploader

  validates :title, presence: true
  validates :author, presence: true
  validates :num_pages, presence: true
  validates :publish_date, presence: true
  validate :check_day_present, on: [:create, :update]

  private
  UNRANSACKABLE_ATTRIBUTES = ["id", "updated_at", "category_id", "created_at", "slug", "description"]

  def self.ransackable_attributes auth_object = nil
    column_names - UNRANSACKABLE_ATTRIBUTES + _ransackers.keys
  end

  def check_day_present
    errors.add :published_date,
      I18n.t("error.wrong_date") if self.publish_date.to_date > Date.today
  end
end
