require "rails_helper"
include Devise::TestHelpers

describe Admin::UsersController, type: :controller do
  let!(:admin){FactoryGirl.create :user, role: :admin}
  let!(:user){FactoryGirl.create :user}
  before{sign_in admin}

  describe "Get #index" do
    before {get :index}
    context "get index successfully" do
      it {expect(response).to be_success}
      it {expect(response).to have_http_status 200}
      it {expect(assigns(:users)).to eq([admin, user])}
      it {expect(response).to render_template "index"}
    end
  end

  describe "Post #destroy" do
    before {delete :destroy, id: user}
    context "delete successfully" do
      it {expect(response).to have_http_status 302}
      it {expect(response).to redirect_to admin_users_path}
      it {expect(flash[:success]).to eq I18n.t("flash.user.deleted")}
      it {expect(User.count).to eq 1}
    end
  end
end
