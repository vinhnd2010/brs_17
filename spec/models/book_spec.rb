require "rails_helper"

describe Book do
  subject(:book) {FactoryGirl.create :book}

  let(:user) {FactoryGirl.create :user}
  let(:category) {FactoryGirl.create :category}

  describe "association" do
    it {expect have_many :reviews}
    it {expect have_many :book_users}
    it {expect have_many :users}
    context "should belong to correct category" do
      before {book.category = category}
      it {expect(book.category).to eq category}
    end
  end

  context "is invalid without a title" do
    before {book.title = nil}
    it {expect(book.error_on(:title).size).to eq 1}
  end

  context "is invalid without a publish_date" do
    before {book.publish_date = nil}
    it {expect(book.error_on(:publish_date).size).to eq 1}
  end

  context "is invalid without an author" do
    before {book.author = nil}
    it {expect(book.error_on(:author).size).to eq 1}
  end

  context "is invalid without a category" do
    before {book.category = nil}
    it {expect(book.error_on(:category).size).to eq 1}
  end

  context "is invalid without a number of page" do
    before {book.num_pages = nil}
    it {expect(book.error_on(:num_pages).size).to eq 2}
  end

  context "is invalid with an incorrect number of page type" do
    before {book.num_pages = "string"}
    it {expect(book.error_on(:num_pages).size).to eq 1}
  end

  context "is invalid with a future date" do
    before {book.publish_date = (Date.today + 1).to_s}
    it {expect(book.error_on(:publish_date).size).to eq 1}
  end
end
