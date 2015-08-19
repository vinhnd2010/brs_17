require "rails_helper"
include Devise::TestHelpers

describe Admin::RequestsController do
  subject(:request) {FactoryGirl.create :request}
  let!(:other_request) {FactoryGirl.create :request}

  before do
    sign_in FactoryGirl.create :admin
  end

  describe "GET #index" do
    before {get :index}

    context "populates an array of requests" do
      it {expect(assigns(:requests)).to eq([other_request, request])}
    end

    context "renders the :index view" do
      it {expect(response).to render_template :index}
    end
  end

  describe "PUT #update" do
    context "valid attributes" do
      before {put :update, id: other_request,
        request: FactoryGirl.attributes_for(:request)}

      it {expect(response).to redirect_to admin_requests_path}
      it {expect(response).to have_http_status 302}
    end

    context "invalid attributes" do
      before {put :update, id: other_request,
        request: FactoryGirl.attributes_for(:invalid_request)}
      it do
        other_request.reload
        expect(other_request.status).to_not eq("accepted")
      end
    end
  end
end
