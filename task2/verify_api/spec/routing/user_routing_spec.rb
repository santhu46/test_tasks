require 'rails_helper'

RSpec.describe "routing to users", :type => :routing do
  it "routes /users/new to users#new for user form" do
    expect(:get => "/users/new").to route_to(
      :controller => "users",
      :action => "new"
    )
  end

  it "routes to create users" do
    expect(:post => "/users").to route_to(
      :controller => "users",
      :action => "create"
    )
  end
  it "routes to get users email verification form" do
    expect(:get => "/users/get_email_verification").to route_to(
      :controller => "users",
      :action => "get_email_verification"
    )
  end
  it "routes to verify user email" do
    expect(:get => "/users/verify_now").to route_to(
      :controller => "users",
      :action => "verify_now"
    )
  end
  it "routes to check email verification" do
    expect(:get => "/Api/V1/users/verify_email").to route_to(
      :controller => "api/v1/users",
      :action => "verify_email",
      :format => "json"
    )
  end

end

