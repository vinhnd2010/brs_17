require "rails_helper"
include Devise::TestHelpers

describe Admin::CategoriesController do
  subject(:category) {FactoryGirl.create :category}

  before do
    sign_in FactoryGirl.create :admin
  end

  describe "GET #index" do
    before {get :index}

    context "populates an array of categories" do
      it {expect(assigns(:categories)).to eq([category])}
    end

    context "renders the :index view" do
      it {expect(response).to render_template :index}
    end
  end

  describe "GET #show" do
    before {get :show, id: category}

    context "assigns the requested category to @category" do
      it {expect(assigns(:category)).to eq category}
    end

    context "renders the #show view" do
      it {expect(response).to render_template :show}
    end
  end

  describe "GET #new" do
    before {get :new}

    context "assigns a name, description to the new category" do
      it {expect(assigns(:category)).to be_a_new Category}
    end

    context "renders the #new view" do
      it {expect(response).to render_template :new}
    end
  end

  describe "POST #create" do
    before {post :create, category: FactoryGirl.attributes_for(:category)}

    context "with valid attributes" do
      it "creates a new category" do
        expect{
          post :create, category: FactoryGirl.attributes_for(:category)
        }.to change(Category, :count).by(1)
      end

      it {expect(flash[:success]).to eq I18n.t("flash.category.created.success")}
    end

    context "with invalid attributes" do
      it "does not save" do
        expect{
          post :create, category: FactoryGirl.attributes_for(:invalid_category)
        }.to_not change(Category, :count)
      end

      it "re-renders the new method" do
        post :create, category: FactoryGirl.attributes_for(:invalid_category)
        response.should render_template :new
      end
    end
  end

  describe "POST #destroy" do
    before :each do
      @category = FactoryGirl.create :category
    end

    context "flash delete success" do
      before {delete :destroy, id: @category}
      it {expect(flash[:success]).to eq I18n.t("flash.category.deleted.success")}
    end

    it "delete category success" do
      expect {
        delete :destroy, id: @category
      }.to change(Category, :count).by(-1)
    end

    context "renders the admin root" do
      before {delete :destroy, id: @category}
      it {expect(response).to redirect_to admin_root_path }
    end
  end
end
