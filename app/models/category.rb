class Category < ActiveRecord::Base
  has_many :books, dependent: :destroy

  validates :name, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end
