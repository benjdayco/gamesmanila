require "rails_helper"

describe Comment do

	context "is not valid" do

		it "is not valid without a product id" do
			expect(FactoryGirl.build(:comment, product: nil)).to_not be_valid
		end

		it "is not valid without a comment" do
			expect(FactoryGirl.build(:comment, body: nil)).to_not be_valid
		end

				it "is not valid without a rating" do
			expect(FactoryGirl.build(:comment, rating: nil)).to_not be_valid
		end
	end
end