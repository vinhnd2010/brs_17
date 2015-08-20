require "rails_helper"
require "will_paginate/array"

describe "admin/categories/index" do
  subject {rendered}
  let(:category) {FactoryGirl.create :category}
  before do
    25.times {FactoryGirl.create :category}
    categories = Category.paginate page: params[:page],
      per_page: Settings.default_per_page
    assign :categories, categories
    assign :test, categories
    sign_in FactoryGirl.create :admin
    render
  end

  context "display correct requests" do
    it "has a title" do
      is_expected.to have_selector "h3", text: I18n.t("category.title")
    end

    it "display correct pagination" do
      is_expected.to have_link "2", href: "/admin/categories?page=2"
    end

    it "renders correct partial" do
      is_expected.to render_template partial: "_category", count: 10
    end

    it {is_expected.to have_content category.name}
  end
end
