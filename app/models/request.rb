class Request < ActiveRecord::Base
  belongs_to :user
  after_save :sent_email

  enum status: [:wait, :accept, :decline]

  private
  def sent_email
    if self.accept?
      RequestMailer.acception_request(self).deliver_now
    end
  end
end
