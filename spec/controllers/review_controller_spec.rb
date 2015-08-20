require "rails_helper"
include Devise::TestHelpers

describe ReviewsController do
  let(:book) {FactoryGirl.create(:book)}
  let (:user) {FactoryGirl.create(:user)}

  subject(:review) {FactoryGirl.create :review, book: book, user: user}

  before do
    sign_in user
  end

  describe "#create" do
    context "create review success" do
      before {post :create, review: FactoryGirl.
        attributes_for(:review, book_id: book.id, user_id: user.id) }
      it {expect(flash[:success]).to eq I18n.t("flash.review.created.success")}
      it {expect(response).to redirect_to book_path review.book}
    end

    context "create review failed" do
      before {post :create, review: FactoryGirl.
        attributes_for(:content_too_short, book_id: book.id, user_id: user.id)}
      it {expect(flash[:danger]).to eq I18n.t("flash.review.created.fails")}
      it {expect(response).to redirect_to book_path review.book}
    end
  end
end
