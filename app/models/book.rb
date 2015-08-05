class Book < ActiveRecord::Base
  belongs_to :category

  has_many :users, through: :book_users
  has_many :book_users, dependent: :destroy
  has_many :reviews, dependent: :destroy

  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
  validates :author, presence: true
  validates :num_pages, presence: true
  validates :publish_date, presence: true
end
