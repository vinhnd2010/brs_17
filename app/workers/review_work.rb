class ReviewWork
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform review_id
    review = Review.find review_id
    UserMailer.email_new_review(review).deliver_now
  end
end
