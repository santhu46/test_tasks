require "rails_helper"

RSpec.describe User do
  context "Error Checking Conditions" do
    it "should check null parameters" do
      user = User.create(email: "")
      expect(user.errors.messages).to eq( :email => ["can't be blank", "email not valid"])
    end
    it "has a check with email format" do
       user = User.create(email: "santhu")
      expect(user.errors.messages).to eq( :email => ["email not valid"])
    end
    it "has to check uniqness of email" do
       user = User.create(email: "santhu@gmail.com")
       user1 = User.create(email: "santhu@gmail.com")
      expect(user1.errors.messages).to eq( :email => ["has already been taken"])
    end
  end
   
    context "Valid Users" do
      it "create an user and valid is true" do
        user = User.create(email: "santhosh@gmail.com")
        expect(user.valid?).to eq( true)
      end  
    end
   
    context "Users Email Status" do
      it "is at creation status is false" do
        user = User.create(email: "santhoshk@gmail.com")
        expect(user.status).to eq( false)
      end  
    end      
end


