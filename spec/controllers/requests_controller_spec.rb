require "rails_helper"
include Devise::TestHelpers

describe RequestsController, type: :controller do
  let!(:user){FactoryGirl.create :user}
  let!(:request1){FactoryGirl.create :request, user: user}
  let!(:request2){FactoryGirl.create :request, user: user}
  before{sign_in user}

  describe "Get #index" do
    before {get :index}
    context "get index successfully" do
      it {expect(response).to be_success}
      it {expect(response).to have_http_status 200}
      it {expect(assigns(:requests)).to eq([request1, request2])}
      it {expect(response).to render_template "index"}
    end
  end

  describe "#new" do
    before {get :new}
    context "Get inew successfully" do
      it {expect(response).to be_success}
      it {expect(response).to render_template :new}
      it {expect(response).to have_http_status :ok}
    end
  end

  describe "#create" do
    context "Create with valid attributes" do
      before {post :create, request: FactoryGirl.attributes_for(:request)}
      it {expect(response).to redirect_to requests_path}
      it {expect(response).to have_http_status :found}
      it {expect(flash[:success]).to eq I18n.t("flash.request.success")}
    end

    context "Create with invalid attributes with book name blank" do
      before {post :create, request: FactoryGirl.attributes_for(:invalid_book_name_request)}
      it {expect(response).to render_template :new}
      it {expect(response).to have_http_status :ok}
      it {expect(flash[:error]).to eq I18n.t("flash.request.fail")}
    end

    context "Create with invalid attributes with author blank" do
      before {post :create, request: FactoryGirl.attributes_for(:invalid_author_request)}
      it {expect(response).to render_template :new}
      it {expect(response).to have_http_status :ok}
      it {expect(flash[:error]).to eq I18n.t("flash.request.fail")}
    end
  end

  describe "#destroy" do
    before {delete :destroy, id: request1}
    context "delete successfully" do
      it {expect(response).to have_http_status 302}
      it {expect(response).to redirect_to requests_path}
      it {expect(flash[:success]).to eq I18n.t("flash.request.deleted")}
      it {expect(Request.count).to eq 1}
    end
  end
end
