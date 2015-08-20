require "rails_helper"
require "will_paginate/array"

describe "admin/requests/index" do
  subject {rendered}
  let(:request) {FactoryGirl.create :request}
  before do
    25.times {FactoryGirl.create :request}
    requests = Request.paginate page: params[:page],
      per_page: Settings.default_per_page
    assign :requests, requests
    assign :test, requests
    sign_in FactoryGirl.create :admin
    render
  end

  context "display correct requests" do
    it "has a title" do
      is_expected.to have_selector "h1", text: I18n.t("request.all_request")
    end

    it "display correct pagination" do
      is_expected.to have_link "2", href: "/admin/requests?page=2"
    end

    it "renders correct partial" do
      is_expected.to render_template partial: "_request", count: 10
    end

    it {is_expected.to have_content request.author}
    it {is_expected.to have_content request.pulisher}
    it {is_expected.to have_content request.status}
  end
end
