require 'spec_helper'

describe WikisController do

  login_user

  before(:each) do
    @user = create(:user)
    @wiki = create(:wiki)
  end

  describe "GET #index" do
    it "populates an array of wikis" do
      get :index
      assigns(:wikis).should eq([@wiki])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested wiki to @wiki" do
      get :show, id: @wiki.id
      assigns(:wiki).should eq(@wiki)
    end

    it "renders the #show template" do
      get :show, id: @wiki.id
      response.should render_template :show
    end

    it "assigns the wiki's sections to @sections" do
      wiki = Wiki.first
      get :show, id: wiki.id
      assigns(:sections).should eq(wiki.sections)
    end
  end

  describe "GET #new" do
    it "assigns a new wiki" do
      get :new
      assigns(:wiki).should be_a_new(Wiki)
    end

    it "renders the #new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested wiki as @wiki" do
      get :edit, id: @wiki.id
      assigns(:wiki).should eq(@wiki)
    end

    it "should render the #edit template" do
      get :edit, id: @wiki.id
      response.should render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new wiki" do
        expect{
          post :create, wiki: attributes_for(:wiki)
        }.to change{Wiki.count}.by(1)
      end

      it "assigns a newly created wiki as @wiki" do
        post :create, wiki: attributes_for(:wiki)
        assigns(:wiki).should be_a(Wiki)
        assigns(:wiki).should be_persisted
      end

      it "redirects to the new wiki" do
        post :create, wiki: attributes_for(:wiki)
        response.should redirect_to Wiki.last
      end
    end

    context "with invalid attributes" do
      it "does not save the new wiki" do
        expect{
          post :create, wiki: attributes_for(:invalid_wiki)
        }.not_to change(Wiki, :count)
      end

      it "re-renders the new method" do
        post :create, wiki: attributes_for(:invalid_wiki)
        response.should render_template :new
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "located the requested @wiki" do
        put :update, id: @wiki.id, wiki: attributes_for(:wiki)
        assigns(:wiki).should eq(@wiki)
      end

      it "changes @wiki's title" do
        put :update, id: @wiki.id,
          wiki: attributes_for(:wiki, title: "The best wiki ever.")
        @wiki.reload
        @wiki.title.should eq("The best wiki ever.")
      end

      it "changes @wiki's author" do
        user2 = create(:user)
        put :update, id: @wiki.id,
          wiki: build(:wiki, author: user2).attributes.symbolize_keys
        @wiki.reload
        @wiki.author.should eq(user2)
      end

      it "redirects to the updated wiki" do
        put :update, id: @wiki.id, wiki: attributes_for(:wiki)
        @wiki.reload
        response.should redirect_to @wiki
      end
    end

    context "with invalid attributes" do
      it "locates the requested @wiki" do
        put :update, id: @wiki.id, wiki: build(:invalid_wiki).attributes.symbolize_keys
        assigns(:wiki).should eq(@wiki)
      end

      it "does not change @wiki's author with an invalid title" do
        user2 = create(:user)
        put :update, id: @wiki.id,
          wiki: build(:wiki, title: nil, author: user2).attributes.symbolize_keys
        @wiki.reload
        @wiki.author.should_not eq(user2)
      end

      it "does not change @wiki's attributes with an invalid author" do
        invalid_wiki = build(:wiki, author_id: nil, title: "The best wiki ever.")
        put :update, id: @wiki.id,
          wiki: invalid_wiki.attributes.slice(*invalid_wiki.class.accessible_attributes)
        @wiki.reload
        @wiki.title.should_not eq("The best wiki ever.")
      end

      it "re-renders the edit method" do
        put :update, id: @wiki.id, wiki: attributes_for(:invalid_wiki)
        response.should render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    it "deletes the wiki" do
      expect{
        delete :destroy, id: @wiki.id
      }.to change(Wiki, :count).by(-1)
    end

    it "redirects to wikis#index" do
      delete :destroy, id: @wiki.id
      response.should redirect_to wikis_url
    end
  end

end    