require "rails_helper"

describe Request, type: :model do
  subject(:request) {FactoryGirl.create :request}
  let(:newest_request) {FactoryGirl.create :request, created_at: Time.now + 2}
  let(:user) {FactoryGirl.create :user}
  let(:accepted_request) {FactoryGirl.create :request,
      created_at: Time.now + 3, status: Request.statuses[:accept]}

  describe "association" do
    context "should return correct user" do
      before {request.user = user}
      it {expect(request.user).to eq user}
    end
  end

  describe "scope" do
    context "should return request correct follow order" do
      it {expect(Request.latest.limit(2)).to eq [newest_request, request]}
    end

    context "should return correct accepted request" do
      it {expect(Request.request_accepted_in_month.latest.limit(1)).to eq [accepted_request]}
    end
  end

  describe "callback" do
    context "should sent_email before update request" do
      it {is_expected.to callback(:sent_email).after(:save)}
    end
  end
end
