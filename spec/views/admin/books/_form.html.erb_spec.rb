require "rails_helper"

describe "admin/books/_book" do
  subject {rendered}
  100.times {FactoryGirl.create(:category)}
  let(:book) {Book.new}

  before do
    assign :book, book
    assign :categories, Category.all
    render partial: "admin/books/form"
  end

  it "render form errors" do
    is_expected.to render_template partial: "_error_messages"
  end

  it "has correct form properties" do
    is_expected.to have_selector "form[action='/admin/books']" do |f|
      f.is_expected.to have_selector "input[type='submit']"
    end
  end

  context "has necessary form fields" do
    it {is_expected.to have_selector ".glyphicon"}
    it {is_expected.to have_selector "input[type='text'][name='book[title]']"}
    it {is_expected.to have_selector "input[type='text'][name='book[author]']"}
    it {is_expected.to have_selector "input[type='text'][name='book[publish_date]']"}
    it {is_expected.to have_selector "input[type='number'][name='book[num_pages]']"}
    it {is_expected.to have_selector "textarea[name='book[description]']"}
    it {is_expected.to have_selector "select[name='book[category_id]']"}
    it {is_expected.to have_selector "input[type='file'][name='book[cover]']"}
  end
end
