require "rails_helper"
require "faraday"
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
  describe "GET #verify_api" do

    test = Faraday.new do |builder|
        builder.adapter :test do |stub|
         stub.get('/verify_api') {[ 200, {}, {:Error => "Email can't be nil"} ]}
         stub.get('/verify_api?email=santhu') {[ 200, {}, {:Error => "Email not valid format"} ]}
         stub.get('/verify_api?email=santosh@gmail.com') {[ 200, {}, {:is_verified => true} ]}
         stub.get('/verify_api?email=santoshk@gmail.com') {[ 200, {}, {:is_verified => false} ]}
       end
    end

    it "responds successfully with an HTTP 200 status code" do
      resp= test.get '/verify_api'
      expect(resp).to be_success

      expect(resp.status).to eq(200)
    end
    it "responds email not nil " do
      resp= test.get '/verify_api'
      expect(resp).to be_success
      expect(resp.body).to eq({:Error => "Email can't be nil"})
    end

    it "renders the verify wrong email format" do
      resp= test.get '/verify_api?email=santhu'
      expect(resp.body).to eq({:Error => "Email not valid format"})
    end

    it "renders the verify email true" do
      resp= test.get '/verify_api?email=santosh@gmail.com'
      expect(resp.body).to eq({:is_verified => true})
    end

    it "renders the verify email false" do
      resp= test.get '/verify_api?email=santoshk@gmail.com'
      expect(resp.body).to eq({:is_verified => false})
    end
  end
end

