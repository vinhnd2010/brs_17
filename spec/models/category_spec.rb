require "rails_helper"

describe Category, type: :model do
  subject(:category) {FactoryGirl.create :category}
  let(:newest_category) {FactoryGirl.create :category, created_at: Time.now + 2}

  describe "association" do
    it {expect have_many :books}
  end

  context "is invalid without name" do
    before {category.name = nil}
    it {expect(category.error_on(:name).size).to eq 1}
  end

  context "is invalid without description" do
    before {category.description = nil}
    it {expect(category.error_on(:description).size).to eq 2}
  end

  context "is invalid with oa short description" do
    before {category.description = "descrip"}
    it {expect(category.error_on(:description).size).to eq 1}
  end

  context "should return categories correct follow order" do
    it {expect(Category.latest.limit(2)).to eq [newest_category, category]}
  end
end
