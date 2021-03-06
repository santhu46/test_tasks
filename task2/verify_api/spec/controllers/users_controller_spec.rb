require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  describe "GET #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end
  describe "GET #get_email_verification" do
    it "responds successfully with an HTTP 200 status code" do
      get :get_email_verification
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the create template" do
      get :get_email_verification
      expect(response).to render_template("get_email_verification")
    end
  end
end

