require 'spec_helper'

describe SectionsController do

  login_user

  before(:each) do
    @user = create(:user)
    @wiki = create(:wiki)
    @section = create(:section)
    @invalid_section = build(:invalid_section)
    @valid_params = @section.attributes.slice(*@section.class.accessible_attributes)
    @invalid_params = @invalid_section.attributes.slice(*@invalid_section.class.accessible_attributes)
  end

  describe "GET #new" do
    it "assigns a new section" do
      get :new
      assigns(:section).should be_a_new(Section)
    end

    it "renders the #new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested section as @section" do
      get :edit, id: @section.id
      assigns(:section).should eq(@section)
    end

    it "should render the #edit template" do
      get :edit, id: @section.id
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new section" do
        expect{
          post :create, section: @valid_params, wiki_id: @wiki.id
        }.to change{Section.count}.by(1)
      end

      it "assigns a newly created section as @section" do
        post :create, section: @valid_params, wiki_id: @wiki.id
        assigns(:section).should be_a(Section)
        assigns(:section).should be_persisted
      end

      it "redirects to the new section" do
        post :create, section: @valid_params, wiki_id: @wiki.id
        response.should redirect_to Section.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new section" do
        expect{
          post :create, section: @invalid_params, wiki_id: @wiki.id
        }.not_to change(Section, :count)
      end

      it "re-renders the new method" do
        post :create, section: @invalid_params, wiki_id: @wiki.id
        response.should render_template :new
      end
    end
  end

  describe "PUT #update" do

    context "with valid params" do
      it "located the requested @section" do
        put :update, id: @section.id, section: attributes_for(:section)
        assigns(:section).should eq(@section)
      end

      it "changes @section's title" do
        put :update, id: @section.id,
          section: attributes_for(:section, title: "The best section ever.")
        @section.reload
        @section.title.should eq("The best section ever.")
      end

      it "changes @section's content" do
        put :update, id: @section.id,
          section: build(:section, content: "Super awesome wiki content.").attributes.symbolize_keys
        @section.reload
        @section.content.should eq("Super awesome wiki content.")
      end

      it "redirects to the updated section" do
        put :update, id: @section.id, section: attributes_for(:section)
        @section.reload
        response.should redirect_to @section
      end

      it "keeps track of the old version" do
        old_content = @section.content
        put :update, id: @section.id, section: attributes_for(:section)
        @section.reload
        @section.diffs.first["content"].first.should eq(old_content)
      end
    end

    context "with invalid attributes" do
      it "locates the requested @section" do
        put :update, id: @section.id, section: build(:invalid_section).attributes.symbolize_keys
        assigns(:section).should eq(@section)
      end

      it "does not change @section's content with an invalid title" do
        put :update, id: @section.id,
          section: build(:section, title: nil, content: "Super awesome wiki content.").attributes.symbolize_keys
        @section.reload
        @section.content.should_not eq("Super awesome wiki content.")
      end

      it "does not change @section's attributes with invalid content" do
        invalid_section = build(:section, content: nil, title: "The best section ever.")
        put :update, id: @section.id,
          section: invalid_section.attributes.slice(*invalid_section.class.accessible_attributes)
        @section.reload
        @section.title.should_not eq("The best section ever.")
      end

      it "re-renders the edit method" do
        put :update, id: @section.id, section: attributes_for(:invalid_section)
        response.should render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the section" do
      expect{
        delete :destroy, id: @section.id
      }.to change(Section, :count).by(-1)
    end

    it "redirects to sections#index" do
      delete :destroy, id: @section.id
      response.should redirect_to sections_url
    end
  end

end    