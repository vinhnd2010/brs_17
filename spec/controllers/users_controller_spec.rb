require "rails_helper"
include Devise::TestHelpers

describe UsersController, type: :controller do
  let!(:user){FactoryGirl.create :user}
  let!(:user1){FactoryGirl.create :user}
  before{sign_in user}

  describe "Get #index" do
    before {get :index}
    context "get index successfully" do
      it {expect(response).to be_success}
      it {expect(response).to have_http_status 200}
      it {expect(assigns(:users)).to eq([user, user1])}
      it {expect(response).to render_template "index"}
    end
  end

  describe "Get #show" do
    before {get :show, id: user}
    it {expect(assigns :user).to eq user}
    it {expect(response).to render_template :show}
  end
end
