require "rails_helper"

describe Comment, type: :model do

  let(:user) {FactoryGirl.create :user}
  let(:review) {FactoryGirl.create :review}
  subject(:comment) {FactoryGirl.create :comment, user: user, review: review}

  context "is invalid without content" do
    before {subject.content = nil}
    it {expect(comment.error_on(:content).size).to eq 2}
  end

  context "should create activity comment log on after save" do
    it {is_expected.to callback(:create_commented_activity).after(:save)}
  end

  context "should send mail when have new comment after commit" do
    it {is_expected.to callback(:send_mail_new_comment).after(:commit)}
  end

  context "should belong to correct user" do
    it {expect(subject.user).to eq user}
  end

  context "should belong to correct review" do
    it {expect(subject.review).to eq review}
  end
end
