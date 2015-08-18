require "rails_helper"

describe Review do
  let(:user) {FactoryGirl.create :user}
  let(:book) {FactoryGirl.create :book}
  subject(:review) {FactoryGirl.create :review, user: user, book: book}

  describe "association" do
    it "has many comments" do
      t = Review.reflect_on_association :comments
      expect(t.macro).to eq :has_many
      expect(t.options[:dependent]).to eq :destroy
    end

    it "belongs to book" do
      t = Review.reflect_on_association :book
      expect(t.macro).to eq :belongs_to
    end

    it "belongs to user" do
      t = Review.reflect_on_association :user
      expect(t.macro).to eq :belongs_to
    end
  end

  describe "validates" do
    context "create is valid" do
      it {is_expected.to be_valid}
    end

    context "content is too short" do
      before {review.content = ""}
      it {is_expected.to_not be_valid}
    end
  end

  describe "call back function" do
    context "set avarage rating after save" do
      it {is_expected.to callback(:set_avarage_rating).after(:save)}
    end

    context "create review activity after save" do
      it {is_expected.to callback(:create_reviewed_activity).after(:save)}
    end

    context "send email new review after commit" do
      it {is_expected.to callback(:send_email_new_review).after(:commit)}
    end
  end
end
