class Request < ActiveRecord::Base
  belongs_to :user

  enum status: [:wait, :accept, :decline]
end
