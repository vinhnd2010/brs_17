require "rails_helper"

describe "admin/books/new.html.erb" do
  subject {rendered}
  100.times {FactoryGirl.create(:category)}
  let(:book) {Book.new}

  before do
    assign :book, book
    assign :categories, Category.all
    render
  end

  context "request to books controller and new action" do
    it {expect(controller.request.path_parameters[:controller]).to eq "admin/books"}
    it {expect(controller.request.path_parameters[:action]).to eq "new"}
  end

  context "have title" do
    it {is_expected.to have_selector "h1"}
    it {is_expected.to include I18n.t("book.new")}
  end

  it "render correct form" do
    is_expected.to have_selector "form[id='new_book'][method='post']"
  end
end
