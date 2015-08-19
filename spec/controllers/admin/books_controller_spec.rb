require "rails_helper"
include Devise::TestHelpers

RSpec.describe Admin::BooksController, type: :controller do
  let!(:user){FactoryGirl.create :user, role: :admin}
  let!(:normal_user){FactoryGirl.create :user}
  let!(:category){FactoryGirl.create :category}
  let!(:book){FactoryGirl.create :book, category: category}

  before do
    sign_in user
  end

  describe "GET #index" do
    context "response to render template index of admin" do
      before do
        get :index
      end
      it {expect(response).to render_template :index}
    end

    context "response when normal user to access to admin index" do
      before do
        sign_out user
        sign_in normal_user
        get :index
      end
      it {expect(flash[:danger]).to eq "Access denied."}
      it {expect(response).to redirect_to :root}
    end
  end

  describe "GET #edit" do
    context "responds by showing the user information" do
      before do
        get :edit, id: book.id
      end
      it {expect(response).to render_template :edit}
    end
  end

  describe "GET #new" do
    context "should response show form of use" do
      before do
        get :new
      end
      it {expect(response).to render_template :new}
    end
  end

  describe "POST #create" do
    context "when the book saves successfully" do
      before {
        post :create, book: FactoryGirl.attributes_for(:book, category_id: category.id)
      }
      it {expect(response).to redirect_to admin_books_path}
      it {expect(response).to have_http_status :found}
      it {expect(flash[:success]).to eq I18n.t("flash.book.created.success")}
    end

    context "fails to create new book" do
      before {post :create, book: FactoryGirl.attributes_for(:title_blank)}
      it {expect(response).to render_template :new}
      it {expect(response).to have_http_status :ok}
      it {expect(flash[:danger]).to eq I18n.t("flash.book.created.fails")}
    end
  end

  describe "PATCH #update" do
    context "when book updates successfully" do
      before {patch :update, id: book.id, book: FactoryGirl.attributes_for(:book)}
      it {expect(response).to redirect_to admin_books_path}
      it {expect(response).to have_http_status :found}
      it {expect(flash[:success]).to eq I18n.t("flash.book.updated.success")}
    end

    context "when book updates fails" do
      before {patch :update, id: book.id, book: FactoryGirl.attributes_for(:title_blank)}
      it {expect(response).to render_template :edit}
      it {expect(response).to have_http_status :ok}
      it {expect(flash[:danger]).to eq I18n.t("flash.book.updated.fails")}
    end
  end
end
