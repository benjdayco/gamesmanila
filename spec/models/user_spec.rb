require "rails_helper"

describe User, :type => :model do


  context "is incomplete user registration" do

     it "is incomplete without an email address" do
      expect(FactoryGirl.build(:user, email: nil)).to_not be_valid
    end

     it "is incomplete without a unique email address" do
      @user = FactoryGirl.create(:user, email: "user@example.com")
      expect(FactoryGirl.build(:user, email: "user@example.com")).to_not be_valid
    end

    it "is incomplete without a valid email address" do
      expect(FactoryGirl.build(:user, email: "not_an_email")).to_not be_valid
    end

    it "is incomplete without a password" do
      expect(FactoryGirl.build(:user, password: nil)).to_not be_valid
    end

  end
end