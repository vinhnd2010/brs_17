require "rails_helper"

describe "admin/books/_book" do
  subject {rendered}
  before do
    @book = FactoryGirl.create :book
    render "admin/books/book", book: @book
  end

  context "contain book title" do
    it {is_expected.to have_selector ".title"}
    it {is_expected.to include @book.title}
  end

  context "contain book description" do
    it {is_expected.to have_selector ".short-desc"}
    it {is_expected.to include @book.description}
  end

  context "contain book author" do
    it {is_expected.to include @book.author}
    it {is_expected.to have_selector ".author"}
  end

  it "contain book image" do
    is_expected.to have_selector ".book-img"
  end

  it "has edit book button" do
    is_expected.to have_selector "a[href='/admin/books/#{@book.slug}/edit']"
  end
end
