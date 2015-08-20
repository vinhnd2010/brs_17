require "rails_helper"

describe "users/_user.html.erb" do
  subject {rendered}
  let(:user) {FactoryGirl.create(:user)}

  before do
    render "users/user", user: user
  end

  it "render correct form" do
    is_expected.to have_selector "a[href='/users/#{user.name}']", text: user.name
  end
end
