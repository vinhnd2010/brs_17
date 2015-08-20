require "rails_helper"
include Devise::TestHelpers

describe BooksController do
  let(:user) {FactoryGirl.create :user}
  let!(:category){FactoryGirl.create :category}
  let!(:book){FactoryGirl.create :book, category: category}

  before do
    sign_in user
  end

  describe "#index" do
    context "response to render template index of book" do
      before do
        get :index
      end
      it {expect(response).to render_template :index}
    end
  end

  describe "GET #show" do
    context "responds by showing the book information" do
      before do
        get :show, id: book.id
      end
      it {expect(response).to render_template :show}
    end
  end
end
