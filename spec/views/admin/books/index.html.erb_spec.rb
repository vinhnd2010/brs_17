require "rails_helper"

describe "admin/books/index.html.erb" do
  before do
    41.times {FactoryGirl.create(:book)}
    @books = Book.paginate page: params[:page], per_page: Settings.paginate_per_page
    render @books
  end

  context "request to books controller and index action" do
    it {expect(controller.request.path_parameters[:controller]).to eq "admin/books"}
    it {expect(controller.request.path_parameters[:action]).to eq "index"}
  end

  context "should list each book" do
    Book.paginate(page: 1).each do |book|
      it {expect(rendered).to have_selector text: book.title}
    end
  end

  context "should return number book per page" do
    it {expect(rendered).to render_template partial: "_book",
      count: Settings.paginate_per_page}
  end

  context "should containt page name" do
    before do
      @test = Book.paginate page: params[:page], per_page: Settings.paginate_per_page
      render
    end
    it {expect(render).to include I18n.t("book.all_book")}
  end

  context "should have pagination" do
    before do
      @test = Book.paginate page: params[:page], per_page: Settings.paginate_per_page
      render
    end
    it {expect(rendered).to have_selector "div.pagination" }
  end
end
