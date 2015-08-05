class User < ActiveRecord::Base
  enum role: [:admin, :employees]

  has_many :activities, dependent: :destroy
  has_many :books, through: :book_users
  has_many :book_users, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :requets, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  has_many :passive_relationships, class_name: "Relationship",
                                   foreign_key: "followed_id",
                                   dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true, length: {maximum: 50,
    too_long: "must have at most %{count} words"}
  validates :password, length: {minimum: 6,
    too_short: "must have at least %{count} words"}, allow_blank: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
end
