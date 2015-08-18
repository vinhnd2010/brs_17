require "rails_helper"

describe User do
  subject(:user) {FactoryGirl.create :user}

  describe "association" do
    it "have many activities" do
      t = User.reflect_on_association :activities
      expect(t.macro).to eq :has_many
      expect(t.options[:dependent]).to eq :destroy
    end

    it "have many books" do
      t = User.reflect_on_association :books
      expect(t.macro).to eq :has_many
      expect(t.options[:through]).to eq :book_users
    end

    it "have many book_users" do
      t = User.reflect_on_association :book_users
      expect(t.macro).to eq :has_many
      expect(t.options[:dependent]).to eq :destroy
    end

    it "have many reviews" do
      t = User.reflect_on_association :reviews
      expect(t.macro).to eq :has_many
      expect(t.options[:dependent]).to eq :destroy
    end

    it "have many comments" do
      t = User.reflect_on_association :comments
      expect(t.macro).to eq :has_many
      expect(t.options[:dependent]).to eq :destroy
    end

    it "have many likes" do
      t = User.reflect_on_association :likes
      expect(t.macro).to eq :has_many
      expect(t.options[:dependent]).to eq :destroy
    end

    it "have many requests" do
      t = User.reflect_on_association :requests
      expect(t.macro).to eq :has_many
      expect(t.options[:dependent]).to eq :destroy
    end

    it "have many active_relationships" do
      t = User.reflect_on_association :active_relationships
      expect(t.macro).to eq :has_many
      expect(t.options[:dependent]).to eq :destroy
      expect(t.options[:class_name]).to eq Relationship.name
      expect(t.options[:foreign_key]).to eq "follower_id"
    end

    it "have many passive_relationships" do
      t = User.reflect_on_association :passive_relationships
      expect(t.macro).to eq :has_many
      expect(t.options[:dependent]).to eq :destroy
      expect(t.options[:class_name]).to eq Relationship.name
      expect(t.options[:foreign_key]).to eq "followed_id"
    end

    it "have many following" do
      t = User.reflect_on_association :following
      expect(t.macro).to eq :has_many
      expect(t.options[:through]).to eq :active_relationships
      expect(t.options[:source]).to eq :followed
    end

    it "have many followers" do
      t = User.reflect_on_association :followers
      expect(t.macro).to eq :has_many
      expect(t.options[:through]).to eq :passive_relationships
      expect(t.options[:source]).to eq :follower
    end
  end

  describe "validates" do
    context "create is valid" do
      it {is_expected.to be_valid}
    end

    context "name is not valid" do
      before {user.name = ""}
      it {is_expected.to_not be_valid}
    end
  end

  describe "function" do
    context "set role after init" do
      it {expect(user.role).to eq "employees"}
    end

    context "set avatar default" do
      before {user.avatar = ""}
      it {expect(user.avatar_default).to eq "user.png"}
    end

    context "follow/unfollow user" do
      let(:other_user) {FactoryGirl.create :user}
      before {user.follow other_user}

      it "following?" do
        expect(user.following? other_user).to be_truthy
      end

      it "unfollow user" do
        expect{user.unfollow other_user}.to change{user.following.count}.by -1
      end
    end
  end
end
