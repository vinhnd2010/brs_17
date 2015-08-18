class Request < ActiveRecord::Base
  belongs_to :user
  after_save :sent_email

  enum status: [:wait, :accept, :decline]

  scope :latest, ->{order created_at: :desc}
  scope :request_accepted_in_month, ->{where "status = ?", statuses[:accept]}

  private
  def sent_email
    if self.accept?
      RequestMailer.acception_request(self).deliver_now
    end
  end
end
