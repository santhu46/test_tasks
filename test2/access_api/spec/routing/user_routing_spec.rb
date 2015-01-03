require 'rails_helper'

RSpec.describe "routing to users", :type => :routing do
  it "routes / to users#new for email enter form" do
    expect(:get => "/").to route_to(
      :controller => "users",
      :action => "new"
    )
  end

  it "routes to verify email" do
    expect(:get => "/users/verify_api").to route_to(
      :controller => "users",
      :action => "verify_api"
    )
  end

end

