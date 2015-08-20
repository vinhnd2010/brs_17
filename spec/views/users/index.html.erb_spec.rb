require "rails_helper"
require "will_paginate/array"

describe "users/index.html.erb" do
  subject {rendered}
  let(:sample_users) do [
    FactoryGirl.create(:user),
    FactoryGirl.create(:user),
    FactoryGirl.create(:user)
  ]
  end

  before do
    users = sample_users.paginate(per_page: 2)
    assign :users, users
    assign :test, users
    render
  end

  it "has a title" do
    is_expected.to have_selector "h1", text: I18n.t("user.index")
  end

  it "render users" do
    is_expected.to render_template partial: "_user"
  end

  it "has correct pagination" do
    is_expected.to have_selector "a[href='/users?page=2']"
    is_expected.to_not have_selector "a[href='/users?page=3']"
  end
end
