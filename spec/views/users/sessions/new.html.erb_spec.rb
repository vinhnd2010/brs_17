require "rails_helper"

describe "users/sessions/new.html.erb" do
  subject {rendered}
  let(:user) {User.new}

  before do
    assign :user, user
    render
  end

  it "render correct form" do
    is_expected.to have_content I18n.t("user.noneAccount")
    is_expected.to have_selector "h2", text: I18n.t("user.login")
    is_expected.to have_selector "form[id='new_user'][method='post'][action='/users/sign_in']"
    is_expected.to have_selector "a", text: I18n.t("user.register")
    is_expected.to have_selector "input[id='user_email'][name='user[email]']"
    is_expected.to have_selector "input[id='user_password'][name='user[password]']"
    is_expected.to have_selector "input[type='submit'][name='commit'][value='Log in']"
  end

  it "render form link" do
    is_expected.to render_template partial: "_links"
  end
end
